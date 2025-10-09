//
//  ConvertStepsButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

/// A primary CTA (call-to-action) button that converts the player's **current steps** into **energy points**.
///
/// ## Responsibilities
/// - Surface how many energy points will be earned *right now* based on `stepsToConvert`.
/// - Trigger the conversion operation and update the player's energy via the supplied view models.
/// - Communicate micro-progress (e.g., "N steps to next ⚡️") when no conversion is yet available.
///
/// ## Design
/// - Visual hierarchy: a bold, single-line headline for the conversion, plus a compact secondary line
///   that shows incremental progress toward the next energy point.
/// - Rounded, high-contrast pill/card appearance consistent with the app's card styling.
/// - Press feedback via a subtle scale animation for perceived responsiveness.
///
/// ## Ownership & State
/// - Observes:
///   - `PlayerStatsViewModel` (external owner): provides and updates player energy.
///   - `StepTrackerViewModel` (external owner): provides current steps and goal; performs commit.
/// - Local state:
///   - `isPressed`: transient UI-only state for press animation. No business impact.
///
/// ## Notes / Non-goals
/// - This view does **not** schedule background conversions; it only converts when tapped.
/// - It assumes step/goal semantics are enforced by the view models and conversion algorithm.
///
/// > Important:
/// > The button **enables** only when a positive energy award is currently available, preventing
/// > accidental taps that would not yield any energy.
///

// MARK: - ConvertStepsButtonView
struct ConvertStepsButtonView: View {
        
    // MARK: - Dependencies
    /// ViewModel for managing player stats, such as health and energy points.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    /// ViewModel for managing steps taken and goals.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    // MARK: - Local UI State
    /// Press animation flag (purely visual; no business logic).
    @State private var isPressed: Bool = false
    
    // MARK: - Derived Values (UI-facing)
    /// Computes the energy points that would be earned on tap **right now**.
    ///
    /// - Uses the conversion model with the current `stepsToConvert` and `totalStepsGoal`.
    /// - Capped to a **maximum of 10** per design spec (avoid overly large jumps).
    /// - Rationale: keeps the display intuitive and avoids surprise large increments.
    private var energyPoints: Int {
        let rawEnergy = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTrackerViewModel.stepTracker.stepsToConvert,
            totalStepsGoal: stepTrackerViewModel.stepTracker.totalStepsGoal
        ).energyPoints
        
        return min(rawEnergy, 10)
    }
        
    /// Computes the remaining steps needed until the **next** energy point becomes available.
    ///
    /// - Logic mirrors the "10 chunks per goal" pattern:
    ///   - `stepsPerEnergy = totalStepsGoal / 10`
    ///   - If we're exactly at a multiple boundary, we report `0` remaining.
    /// - Helps the player understand micro-progress when the main button is disabled.
    private var stepsUntilNextEnergyPoint: Int {
        let stepsPerEnergy = max(stepTrackerViewModel.stepTracker.totalStepsGoal / 10, 1)
        let remainingSteps = stepsPerEnergy - (stepTrackerViewModel.stepTracker.stepsToConvert % stepsPerEnergy)
        return remainingSteps == stepsPerEnergy ? 0 : remainingSteps
    }
        
    /// Gate for the button's enabled/disabled state.
    ///
    /// - Enabled only when a positive conversion is available to prevent no-op taps.
    /// - NOTE: Keep this check in sync with any server-side or VM-side constraints to avoid UX mismatches.
    private var isButtonEnabled: Bool {
        // CHANGE FOR PREVIEW > or ==
        energyPoints > 0
    }
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            // Guard prevents no-op taps (UX polish).
            guard isButtonEnabled else { return }
            
            // First, reflect the energy that would be earned (as currently computed).
            // NOTE: This uses `calculateEnergyPoints()` which should match the logic used in commit.
            // If commit later also calls a callback that applies the same points, ensure we don't double-apply.
            let newEnergy = stepTrackerViewModel.calculateEnergyPoints() + playerStatsViewModel.playerStats.energy
            playerStatsViewModel.updateEnergy(to: newEnergy)
                
            // Perform the commit to update the step tracker totals and (optionally) hand back energy.
            // NOTE: As implemented in current VM, the closure may be a no-op. If that changes later and
            // energy is also applied here, we might double count. See TODO below.
            stepTrackerViewModel.commitStepsToTotal { energyPoints in
                playerStatsViewModel.updateEnergy(
                    to: playerStatsViewModel.playerStats.energy + energyPoints
                )
            }
        }) {
            // iOS 26-only branch for `.glass` style. Leave as-is to preserve behavior.
            if #available(iOS 26.0, *) {
                VStack(spacing: 4) {
                    // Primary line (conversion headline).
                    HStack(spacing: 8) {
                        Text("Convert \(stepTrackerViewModel.stepTracker.stepsToConvert) steps")
                            .font(.title3) // Intentional fixed role; large label with good legibility.
                            .fontWeight(.semibold)
                        
                        Image(systemName: "arrow.right.circle")
                            .font(.headline)
                        
                        // Displays current conversion yield (already capped).
                        Text("\(energyPoints)")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Image(systemName: "bolt.fill")
                            .font(.headline)
                    }
                    .opacity(0.95)
                    .lineLimit(1)
                    .monospacedDigit()
                    
                    // Secondary line (micro-progress feedback).
                    HStack {
                        // CHANGE FOR PREVIEW TO > or ==
                        if energyPoints > 0 {
                            Text("+1")
                            Image(systemName: "bolt.fill")
                            Text("for every \(stepTrackerViewModel.stepTracker.totalStepsGoal / 10) steps")
                        } else {
                            Text("\(stepsUntilNextEnergyPoint) steps to next")
                            Image(systemName: "bolt.fill")
                        }
                    }
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .monospacedDigit()
                }
                .buttonStyle(.glass) // Modern large-button styling on iOS 26+
                .frame(width: 352, height: 68) // NOTE: Fixed size for consistent layout with sibling cards.
                .background(isButtonEnabled ? .blue : .gray.opacity(0.45))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: AppStyle.Card.cornerRadius))
                .shadow(color: isButtonEnabled ? Color.black.opacity(0.32) : .clear, radius: 8, x: 0, y: 4)
                .scaleEffect(isPressed && isButtonEnabled ? 0.97 : 1.0) // Press feedback (small, fast)
                .animation(.easeInOut(duration: 0.2), value: isPressed)
            } else {
                // Fallback on earlier versions
                // FIXME(gustavo): Provide a pre-iOS 26 fallback style consistent with the app’s card buttons.
                // (e.g., use CardBackgroundView + AppStyle tokens for color/typography.)
            }
        }
        .disabled(!isButtonEnabled)
        // Using onLongPressGesture as a simple press/highlight mechanism.
        // This keeps Button's tap semantics intact while giving press feedback.
        .onLongPressGesture(minimumDuration: 0, maximumDistance: 50, pressing: { pressing in
            if isButtonEnabled {
                isPressed = pressing
            }
        }, perform: {})
    }
}

// MARK: - Previews
#Preview {
    let playerStatsViewModel = PlayerStatsViewModel()
    let stepTrackerViewModel = StepTrackerViewModel()
    return ConvertStepsButtonView(
        playerStatsViewModel: playerStatsViewModel,
        stepTrackerViewModel: stepTrackerViewModel
    )
}

#Preview("Dashboard") {
    let previewAchievementsViewModel = AchievementsViewModel()
    let previewStepTrackerViewModel = StepTrackerViewModel()
    let previewStoryCardViewModel = StoryCardViewModel()
    let previewPlayerStatsViewModel = PlayerStatsViewModel()
    
    DashboardView(
        stepTrackerViewModel: previewStepTrackerViewModel,
        achievementsViewModel: previewAchievementsViewModel,
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: previewAchievementsViewModel,
            playerStatsViewModel: previewPlayerStatsViewModel
        ),
        playerStatsViewModel: previewPlayerStatsViewModel,
        storyCardViewModel: previewStoryCardViewModel
    )
}

// MARK: - Maintenance Notes
// TODO(gustavo): Localize all user-visible strings (e.g., "Convert", "steps to next", "for every").
// TODO(gustavo): Consider moving fixed dimensions (352x68) into AppStyle tokens for consistency & easy tuning.
// TODO(gustavo): Provide a visual/style fallback for iOS < 26 that matches CardNavigationView.
// TODO(gustavo): Revisit double-application risk. If `commitStepsToTotal` begins invoking the closure with
//               a non-zero energy value (in addition to the pre-apply above), this could double-credit
//               energy. Strategy: Either rely solely on commit callback *or* make commit purely step-state
//               and keep energy application centralized here.
// TODO(gustavo): Consider haptic feedback on success (e.g., `UINotificationFeedbackGenerator`) for a satisfying tap.
// NOTE: `stepsPerEnergy` assumes a 10-chunk goal model. If future iterations change the ratio,
//       extract that divisor into a shared constant or the VM to avoid divergence.
// NOTE: `isPressed` animation is brief by design to keep the control feeling snappy.
// NOTE: We intentionally avoid adding accessibility attributes per request; add later as needed.

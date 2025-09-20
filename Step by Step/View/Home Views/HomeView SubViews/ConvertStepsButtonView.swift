//
//  ConvertStepsButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

/// A button that converts the user's current steps into energy points.
/// This view encourages user activity by converting real-world steps into
/// game energy, rewarding progress toward their daily step goal.
struct ConvertStepsButtonView: View {
    
    /// ViewModel for managing player stats, such as health and energy points.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel

    /// ViewModel for managing steps taken and goals.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    /// Press animation state.
    @State private var isPressed: Bool = false
    
    /// Computed property to calculate how many energy points would be earned on tap, capped at 10.
    private var energyPoints: Int {
        let rawEnergy = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTrackerViewModel.stepTracker.stepsToConvert,
            totalStepsGoal: stepTrackerViewModel.stepTracker.totalStepsGoal
        ).energyPoints
        
        return min(rawEnergy, 10)
    }
    
    private var stepsUntilNextEnergyPoint: Int {
        let stepsPerEnergy = max(stepTrackerViewModel.stepTracker.totalStepsGoal / 10, 1)
        let remainingSteps = stepsPerEnergy - (stepTrackerViewModel.stepTracker.stepsToConvert % stepsPerEnergy)
        return remainingSteps == stepsPerEnergy ? 0 : remainingSteps
    }
    
    /// Determines if the button should be active.
    private var isButtonEnabled: Bool {
        // CHANGE FOR PREVIEW > or ==
        energyPoints > 0
    }
    
    var body: some View {
        Button(action: {
            guard isButtonEnabled else { return }
            let newEnergy = stepTrackerViewModel.calculateEnergyPoints() + playerStatsViewModel.playerStats.energy
            playerStatsViewModel.updateEnergy(to: newEnergy)
             
            stepTrackerViewModel.commitStepsToTotal { energyPoints in
                playerStatsViewModel.updateEnergy(
                    to: playerStatsViewModel.playerStats.energy + energyPoints
                )
             }
        }) {
            VStack(spacing: 4) {
                HStack(spacing: 8) {
                    Text("Convert \(stepTrackerViewModel.stepTracker.stepsToConvert) steps")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right.circle")
                        .font(.headline)
                    Text("\(energyPoints)") // Displays capped energy conversion.
                        .font(.title3)
                        .fontWeight(.bold)
                    Image(systemName: "bolt.fill")
                        .font(.headline)
                }
                .opacity(0.95)
                .lineLimit(1)
                .monospacedDigit()
                
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
            .frame(width: 352, height: 68)
            .background(isButtonEnabled ? .blue : .gray.opacity(0.45))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: AppStyle.Card.cornerRadius))
            .shadow(color: isButtonEnabled ? Color.black.opacity(0.32) : .clear, radius: 8, x: 0, y: 4)
            .scaleEffect(isPressed && isButtonEnabled ? 0.97 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: isPressed)
        }
        .disabled(!isButtonEnabled)
        .onLongPressGesture(minimumDuration: 0, maximumDistance: 50, pressing: { pressing in
            if isButtonEnabled {
                isPressed = pressing
            }
        }, perform: {})
    }
}

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

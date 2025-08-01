//
//  ConvertedStepsProgressRingView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

/// A circular progress indicator representing the user's current step count progress toward their daily goal.
///
/// Displays real-time feedback on steps taken, including a motivational helper message and visual progress ring.
struct ConvertedStepsProgressRingView: View {
    
    /// ViewModel managing the user's step tracking data.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    /// Computes progress as a normalized value (0.0–1.0).
    ///
    /// Progress is capped at 100%. Additional steps beyond the goal won't extend the ring.
    private var progress: Double {
        min(Double(stepTrackerViewModel.stepTracker.totalStepsTaken) /
            Double(stepTrackerViewModel.stepTracker.totalStepsGoal), 1.0)
    }
    
    /// Provides motivational text based on progress milestones.
    private var progressHelperText: String {
        switch progress {
        case ..<0.10:
            return "Let's get started."
        case ..<0.25:
            return "Nice start—keep it going."
        case ..<0.50:
            return "Nearly halfway—nice pace."
        case ..<0.75:
            return "Over halfway—keep pushing."
        case ..<1.0:
            return "Almost there—close the ring."
        default:
            return "Goal met! Go for a new record?"
        }
    }
    
    var body: some View {
        ZStack {
            // Background Circle (Unfilled)
            Circle()
                .stroke(lineWidth: 20)
                .foregroundStyle(.wave3)
                .opacity(0.2)
            
            // Animated Progress Circle
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [.wave3, .blue]),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360 * progress)
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .shadow(color: .black.opacity(0.24), radius: 4)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.6), value: progress)
            
            // Step Count, Icon, Goal
            VStack(spacing: 4) {
                Image(systemName: "figure.walk.motion")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack(spacing: 0) {
                    Text("\(stepTrackerViewModel.stepTracker.totalStepsTaken)")
                        .font(.system(size: 52,
                                      weight: .bold,
                                      design: .rounded)
                        )
                        .monospacedDigit()
                    
                    Text("\(stepTrackerViewModel.stepTracker.totalStepsTaken == 1 ? "step" : "steps") converted")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                Text(progressHelperText)
                    .font(.footnote)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                
                Text("Goal \(stepTrackerViewModel.stepTracker.totalStepsGoal)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .monospacedDigit()
            }
        }
        .frame(width: 268, height: 268)
    }
}

#Preview {
    let stepTrackerViewModel = StepTrackerViewModel()
    stepTrackerViewModel.setTotalStepsTaken(2500)
    return ConvertedStepsProgressRingView(stepTrackerViewModel: stepTrackerViewModel)
}

#Preview {
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

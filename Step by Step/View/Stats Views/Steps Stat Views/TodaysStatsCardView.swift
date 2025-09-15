//
//  TodaysStatsCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// Displays a summary card with today's step count, goal progress, and distance traveled.
///
/// Used in the `DashboardView` to provide the user with a snapshot of their daily stats.
/// Layout includes two vertical columns:
/// - Left: current step count and step goal
/// - Right: goal progress percentage and distance in miles
struct TodaysStatsCardView: View {
    /// Observed ViewModel to track and update current step data in real time.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel

    var body: some View {
        ZStack {
            // Background color with rounded corners
            CardBackgroundView()
            
            HStack {
                // MARK: - Left Column: Step Count
                VStack(alignment: .leading, spacing: 8) {
                    // Auto-pluralizes based on step count (e.g. "Step" vs "Steps")
                    Text("Today's \(stepTrackerViewModel.stepTracker.currentStepCount == 1 ? "Step" : "Steps")")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                                        
                    // Large bold step count with monospaced digits for better visual alignment
                    Text("\(stepTrackerViewModel.stepTracker.currentStepCount)")
                        .font(.system(size: 52, weight: .bold, design: .rounded))
                        .opacity(0.9)
                        .monospacedDigit()
                        .padding(.bottom, 2)

                    // Daily goal label
                    Text("of \(stepTrackerViewModel.stepTracker.totalStepsGoal)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .monospacedDigit()
                }
                .padding()

                Spacer()

                // MARK: - Right Column: Goal Progress & Distance
                VStack(alignment: .leading) {
                    Text("Goal Progress")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Text(stepTrackerViewModel.goalProgress)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    Text("Distance")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    // Distance formatted to 2 decimal places
                    Text("\(String(format: "%.2f", stepTrackerViewModel.stepTracker.currentDistance)) mi")
                        .font(.title3)
                        .bold()
                }
                .padding()
            }
        }
        .frame(height: 140)
    }
}

#Preview {
    TodaysStatsCardView(
        stepTrackerViewModel: StepTrackerViewModel()
    )
}

#Preview("DashboardView") {
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

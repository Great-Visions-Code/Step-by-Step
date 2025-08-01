//
//  StatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/14/25.
//

import SwiftUI

/// Displays a user's step activity breakdown including current stats and historical graph.
///
/// Combines both the current day's summary via `StepsStatsView` and the multi-day bar chart
/// via `StepStatsGraphView`. Used within the Achievements tab to provide users with insight into
/// their walking patterns and overall progress.
struct StatsView: View {
    /// Observed ViewModel to track step count dynamically
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    var body: some View {
        VStack {
            // MARK: - Daily Step Summary
            // Displays today's step count, distance, and goal progress percentage
            StepsStatsView(
                stepTrackerViewModel: stepTrackerViewModel
            )
            .padding(.top, 28)
            
            // MARK: - Distance & Goal Progress
            HStack(spacing: 16) {
                StepsCardStatsView(
                    title: "DISTANCE",
                    value: "\(String(format: "%.2f", stepTrackerViewModel.stepTracker.currentDistance)) mi"
                )
                StepsCardStatsView(
                    title: "GOAL PROGRESS",
                    value: stepTrackerViewModel.goalProgress
                )
            }
            .padding()

            // MARK: - Step History Graph
            // Shows a horizontal scrollable bar chart of recent days' step counts
            StepStatsGraphView(
                stepTrackerViewModel: stepTrackerViewModel
            )
        }
        .onAppear {
            stepTrackerViewModel.updateCurrentStepCount()
            stepTrackerViewModel.updateCurrentDistance()
            stepTrackerViewModel.updateSevenDayStepAverage()
        }
    }
}

#Preview {
    StatsView(
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

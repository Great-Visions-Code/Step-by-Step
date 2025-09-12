//
//  StatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/14/25.
//

import SwiftUI

/// Displays a user's step activity breakdown including current stats and historical graph.
///
/// Combines both the current day's summary via `TodaysStatsCardView` and the multi-day bar chart
/// via `DailyStepsGraphCardView`. Used within the Achievements tab to provide users with insight into
/// their walking patterns and overall progress.
struct StatsView: View {
    /// Observed ViewModel to track step count dynamically
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    var body: some View {
        
        let maxStepCount = stepTrackerViewModel.maxStepCount
        let bestDayDate = stepTrackerViewModel.bestDayDateFormatted
        
        VStack(spacing: 20) {
            // MARK: - Daily Step Summary
            // Displays today's step count, distance, and goal progress percentage
            TodaysStatsCardView(
                stepTrackerViewModel: stepTrackerViewModel
            )
            .padding(.top)
            .padding(.horizontal)
            
            // MARK: - Distance & Goal Progress
            HStack(spacing: 16) {
                StepsStatsCardView(
                    title: "Best Streak",
                    value: "\(stepTrackerViewModel.longestStepStreak) \(stepTrackerViewModel.longestStepStreak == 1 ? "day" : "days")",
                    subheading: "Current \(stepTrackerViewModel.currentStepStreak)"
                )
                
                StepsStatsCardView(
                    title: "Best Day",
                    value: "\(maxStepCount.formatted())",
                    subheading: bestDayDate
                )
                
                StepsStatsCardView(
                    title: "7-day avg",
                    value: "\(Int(stepTrackerViewModel.stepTracker.sevenDayStepAverage).formatted())",
                    subheading: nil
                )
            }
            .padding(.horizontal)

            // MARK: - Step History Graph
            // Shows a horizontal scrollable bar chart of recent days' step counts
            DailyStepsGraphCardView(
                stepTrackerViewModel: stepTrackerViewModel
            )
            .padding(.horizontal)
            
            // MARK: - Card Navigation Link
            // NavigationLink to AchievementsListView.swift
            NavigationCardView(
                title: "Milestones",
                value: "View",
                subheading: nil,
                destination: AchievementsListView(
                    achievementsViewModel: AchievementsViewModel(),
                    stepTrackerViewModel: StepTrackerViewModel(),
                    healthKitViewModel: HealthKitViewModel()
                )
            )
            .padding(.horizontal)
            
            Spacer()
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

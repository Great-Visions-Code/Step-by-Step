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
/// via `DailyStepsBarChartView`. Used within the Achievements tab to provide users with insight into
/// their walking patterns and overall progress.
struct StatsView: View {
    /// Observed ViewModel to track step count dynamically
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    var body: some View {
        
        let maxStepCount = stepTrackerViewModel.maxStepCount
        let bestDayDate = stepTrackerViewModel.bestDayDateFormatted
        NavigationStack {
            ZStack{
                WaveBackground()
                
                ScrollView(.vertical, showsIndicators: false) {
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
                            StatsCardView(
                                title: "Best Streak",
                                value: "\(stepTrackerViewModel.longestStepStreak) \(stepTrackerViewModel.longestStepStreak == 1 ? "day" : "days")",
                                subStat: "Current \(stepTrackerViewModel.currentStepStreak)"
                            )
                            
                            StatsCardView(
                                title: "Best Day",
                                value: "\(maxStepCount.formatted())",
                                subStat: bestDayDate
                            )
                            
                            StatsCardView(
                                title: "7-day avg",
                                value: "\(Int(stepTrackerViewModel.stepTracker.sevenDayStepAverage).formatted())",
                                subStat: nil
                            )
                        }
                        .padding(.horizontal)
                        
                            // MARK: - Step History Graph
//                            // Shows a horizontal scrollable bar chart of recent days' step counts
//                        DailyStepsBarChartView(
//                            stepTrackerViewModel: stepTrackerViewModel
//                        )
//                        .padding(.horizontal)
                        
                        // MARK: - Step History Bar Chart
                        StepsBarChartView(
                            stepTrackerViewModel: stepTrackerViewModel
                        )
                        .padding(.horizontal)
                        
                            // MARK: - Card Navigation Link
                            // NavigationLink to AchievementsView.swift
                        CardNavigationView(
                            title: "Achievements",
                            value: "View",
                            subheading: nil,
                            destination: AchievementsView(
                                achievementsViewModel: AchievementsViewModel(),
                                stepTrackerViewModel: StepTrackerViewModel(),
                                healthKitViewModel: HealthKitViewModel()
                            )
                        )
                        .padding(.horizontal)
                        
                        Spacer()
                        
                    }
                }
            }
        }
        .onAppear {
            stepTrackerViewModel.updateCurrentStepCount()
            stepTrackerViewModel.updateCurrentDistance()
            stepTrackerViewModel.updateSevenDayStepAverage()
        }
    }
}

fileprivate final class StepHistoryMockStepTrackerViewModel: StepTrackerViewModel {
    private let mockHistory: [(date: String, steps: Int)]

    /// Build random-ish step history for the last `historyDays` days.
    init(historyDays: Int = 30, base: Int = 4000, variance: Int = 6000) {
        // Generate "M/d/yy" strings to match your VM expectations.
        let cal = Calendar.current
        let df = DateFormatter()
        df.dateFormat = "M/d/yy"

        var hist: [(date: String, steps: Int)] = []
        for i in stride(from: historyDays - 1, through: 0, by: -1) {
            let day = cal.startOfDay(for: Date()).addingTimeInterval(TimeInterval(-86400 * i))
            let steps = max(0, base + Int.random(in: -variance...variance))
            hist.append((date: df.string(from: day), steps: steps))
        }

        self.mockHistory = hist
        super.init()

        // Seed today's live count so your chart can optionally merge it.
        self.updateCurrentSteps(to: hist.last?.steps ?? 0)
    }

    override func sortedStepData() -> [(date: String, steps: Int)] {
        mockHistory
    }

    override func updateStepHistory() {
        // no-op in previews
    }
}

#Preview {
    StatsView(
        stepTrackerViewModel: StepHistoryMockStepTrackerViewModel(historyDays: 30)
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

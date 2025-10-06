//
//  StatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/14/25.
//

import SwiftUI

/// A vertically scrollable dashboard that summarizes the user’s step activity.
///
/// ## Responsibilities
/// - Presents a high-level overview: today’s stats, streaks/best day/7-day average, and a historical bar chart.
/// - Provides a navigational entry point to detailed achievements.
///
/// ## Design
/// - Uses the app’s background (`WaveBackground`) and card components to maintain visual consistency.
/// - Respects Dynamic Type by relying on semantic fonts and avoiding hardcoded sizes where practical.
/// - Content is grouped with comfortable spacing and large tap targets.
///
/// ## Ownership & State
/// - Observes `StepTrackerViewModel` (owned by the parent) to render live step information.
/// - Maintains a private `didLoad` flag to avoid duplicate fetches across navigations.
/// - All fetching is performed via `refreshAll()` which is expected to be `@MainActor`.
///
/// > Note: Strings are currently hard-coded. See the `TODO(gustavo)` to localize user-visible text.
///
struct StatsView: View {
    // MARK: - Dependencies
    /// Observed ViewModel to track step count dynamically.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
        
    // MARK: - State
    /// Prevents repeated data loads when navigating back to this screen.
    @State private var didLoad = false
    
    // MARK: - User-Facing Strings (to localize)
    // TODO(gustavo): Localize user-visible strings and consider an accessibility-only summary string.
    private let titleAchievements = "Achievements"
    private let ctaView = "View"
    private let section7DayAvg = "7-day avg"
    private let sectionBestDay = "Best Day"
    private let sectionBestStreak = "Best Streak"
    private let sectionCurrentPrefix = "Current "
    private let screenTitle = "Daily Steps" // Used in nested cards only; top-level uses section headers
        
    // MARK: - Body
    var body: some View {
        // Pre-compute derived values once per render for readability.
        // The view model provides these values already, so no heavy work occurs here.
        let maxStepCount = stepTrackerViewModel.maxStepCount
        let bestDayDate = stepTrackerViewModel.bestDayDateFormatted
        
        NavigationStack {
            ZStack {
                // MARK: Background
                // Decorative; no semantic meaning for VoiceOver.
                WaveBackground()
                    
                // MARK: Scrollable Content
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        // MARK: - Today’s Summary Card
                        // Displays today's step count, distance, and goal progress percentage.
                        TodaysStatsCardView(
                            stepTrackerViewModel: stepTrackerViewModel
                        )
                        .padding(.top)
                        .padding(.horizontal)
                            
                        // MARK: - KPI Cards Row (streaks, best day, 7-day average)
                        HStack(spacing: 16) {
                            StatsCardView(
                                title: sectionBestStreak,
                                value: "\(stepTrackerViewModel.longestStepStreak) \(stepTrackerViewModel.longestStepStreak == 1 ? "day" : "days")",
                                subStat: "\(sectionCurrentPrefix)\(stepTrackerViewModel.currentStepStreak)"
                            )
                            
                            StatsCardView(
                                title: sectionBestDay,
                                value: "\(maxStepCount.formatted())",
                                subStat: bestDayDate
                            )
                                
                            StatsCardView(
                                title: section7DayAvg,
                                value: "\(Int(stepTrackerViewModel.stepTracker.sevenDayStepAverage).formatted())",
                                subStat: nil
                            )
                        }
                        .padding(.horizontal)
                        
                        // MARK: - Step History Bar Chart
                        StepsBarChartView(
                            stepTrackerViewModel: stepTrackerViewModel
                        )
                        .padding(.horizontal)
                        
                        // MARK: - Card Navigation Link → Achievements
                        CardNavigationView(
                            title: titleAchievements,
                            value: ctaView,
                            subheading: nil,
                            destination: AchievementsView(
                                achievementsViewModel: AchievementsViewModel(),
                                stepTrackerViewModel: StepTrackerViewModel(),
                                healthKitViewModel: HealthKitViewModel()
                            )
                        )
                        .padding(.horizontal)
                        
                        Spacer(minLength: 8)
                    }
                }
                .refreshable {
                    // Safe: hops to @MainActor because the method is annotated.
                    await stepTrackerViewModel.refreshAll()
                }
            }
        }
        // Runs once per instance; avoids repeated fetches when navigating back.
        .task {
            guard !didLoad else { return }
            didLoad = true
            await stepTrackerViewModel.refreshAll()
        }
    }
}

extension StepTrackerViewModel {
    /// Call from .task and .refreshable. Runs on the main actor so all @Published writes are safe.
    @MainActor
    func refreshAll() async {
        // If these do work off-main (HealthKit callbacks), keep them as-is;
        // this method just guarantees the *publishing* happens from main.
        updateStepHistory()
        updateCurrentStepCount()
        updateCurrentDistance()
        updateSevenDayStepAverage()
    }
}

// MARK: - Previews (Preview-only mock VM)
//
// Keeps previews fast, deterministic enough, and independent of HealthKit.
// NOTE: This type is file-private to avoid polluting app scope.
fileprivate final class StepHistoryMockStepTrackerViewModel: StepTrackerViewModel {
    private let mockHistory: [(date: String, steps: Int)]

    /// Build random-ish step history for the last `historyDays` days.
    /// Values are generated oldest → newest with a baseline plus variance.
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

// MARK: - Previews
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

// MARK: - Maintenance Notes
//
// - Keep network/HealthKit fetches out of `body` to avoid repeated work.
// - Prefer semantic fonts and colors for Dynamic Type and Dark Mode compatibility.
// - If step loading gets heavier, consider a lightweight skeleton state.
// - Consider localizing all user-visible strings.
// - If `refreshAll()` ever does heavy work, confirm `@MainActor` usage and add progress indicators.
//

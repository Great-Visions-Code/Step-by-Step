//
//  AchievementsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//
import SwiftUI
/// Displays all achievement categories in a scrollable layout.
///
/// This screen organizes achievements into multiple sections:
/// - **Story Achievements** → Navigates to a dedicated view for story progress.
/// - **Steps In A Day** → Daily milestones based on single-day step counts.
/// - **Total Steps Taken** → Lifetime milestones for accumulated steps.
/// - **Total Distance Traveled** → Lifetime milestones for distance walked.
///
/// ### Data Sources:
/// - `AchievementsViewModel`: Handles unlocking logic and prepares `AchievementCardItems`.
/// - `StepTrackerViewModel`: Provides historical step and distance data.
/// - `HealthKitViewModel`: Supplies live daily step count directly from HealthKit.
///
/// ### Layout:
/// - A `WaveBackground` provides visual consistency across screens.
/// - Achievements are grouped into sections using `AchievementSectionView`.
/// - Story achievements are displayed via a tappable `CardNavigationView`.
struct AchievementsView: View {
    /// Tracks and manages achievement unlocking and milestone logic.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    
    /// Provides historical and current step statistics.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    /// Supplies live step count data from Apple HealthKit.
    @ObservedObject var healthKitViewModel: HealthKitViewModel
    var body: some View {
        ZStack {
            // MARK: - Background Layer
            // Reuses app-wide wave background for stylistic consistency.
            WaveBackground()
            
            // MARK: - Main Content
            ScrollView {
                VStack(spacing: 12) {
                    
                    // MARK: - Story Achievements Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Story Achievements")
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        
                        // NavigationCardView leads to dedicated Story Achievements screen
                        CardNavigationView(
                            title: "Survive Achievements",
                            value: "View",
                            subheading: nil,
                            destination: StoryAchievementsView(
                                achievementsViewModel: AchievementsViewModel()
                            )
                        )
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Steps In A Day Achievements
                    AchievementSectionView(
                        title: "Steps in a Day",
                        achievements: achievementsViewModel.stepsInADayDisplayItems(
                            currentSteps: healthKitViewModel.hkCurrentStepsCount,
                            stepHistory: stepTrackerViewModel.sortedStepData()
                        )
                    )
                    .padding(.horizontal)
                    
                    // MARK: - Total Steps Taken Achievements
                    AchievementSectionView(
                        title: "Total Steps Taken",
                        achievements: achievementsViewModel.totalStepsDisplayItems(
                            stepHistory: stepTrackerViewModel.sortedStepData()
                        )
                    )
                    .padding(.horizontal)
                    
                    // MARK: - Total Distance Traveled Achievements
                    AchievementSectionView(
                        title: "Total Distance Traveled",
                        achievements: achievementsViewModel.totalDistanceDisplayItems(
                            stepHistory: stepTrackerViewModel.sortedStepData()
                        )
                    )
                    .padding(.horizontal)
                }
            }
        }
    }
}
// MARK: - SwiftUI Previews
#Preview {
    NavigationStack {
        AchievementsView(
            achievementsViewModel: AchievementsViewModel(),
            stepTrackerViewModel: StepTrackerViewModel(),
            healthKitViewModel: HealthKitViewModel()
        )
    }
}

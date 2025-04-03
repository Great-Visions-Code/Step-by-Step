//
//  AchievementsListView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// Displays all achievement categories in a scrollable layout.
///
/// This view is responsible for listing achievements grouped by category:
/// - Story Achievements (navigates to a separate view)
/// - Steps In A Day
/// - Total Steps Taken
/// - Total Distance Traveled
///
/// It consumes data from three view models:
/// - `AchievementsViewModel` for unlocked milestone logic
/// - `StepTrackerViewModel` for historical step data
/// - `HealthKitViewModel` for live step count updates
struct AchievementsListView: View {
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    @ObservedObject var healthKitViewModel: HealthKitViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {

                // MARK: - Story Achievements Shortcut Card
                VStack(alignment: .leading, spacing: 8) {
                    Text("Story Achievements")
                        .font(.headline)
                        .foregroundStyle(.secondary)

                    NavigationLink(
                        destination: StoryAchievementsView(
                            achievementsViewModel: AchievementsViewModel()
                        )
                    ) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("View Survive Achievements")
                                    .font(.headline)

                                Text("Track your story achievements")
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                        .padding(.horizontal)
                    }
                }

                // MARK: - Steps In A Day Achievements
                AchievementSectionView(
                    title: "Steps In A Day",
                    achievements: achievementsViewModel.stepsInADayDisplayItems(
                        currentSteps: healthKitViewModel.hkCurrentStepsCount,
                        stepHistory: stepTrackerViewModel.sortedStepData()
                    )
                )

                // MARK: - Total Steps Taken Achievements
                AchievementSectionView(
                    title: "Total Steps Taken",
                    achievements: achievementsViewModel.totalStepsDisplayItems(
                        stepHistory: stepTrackerViewModel.sortedStepData()
                    )
                )

                // MARK: - Total Distance Traveled Achievements
                AchievementSectionView(
                    title: "Total Distance Traveled",
                    achievements: achievementsViewModel.totalDistanceDisplayItems(
                        stepHistory: stepTrackerViewModel.sortedStepData()
                    )
                )
            }
            .padding(.horizontal)
            .padding(.top, 16)
        }
    }
}

#Preview {
    NavigationStack {
        AchievementsListView(
            achievementsViewModel: AchievementsViewModel(),
            stepTrackerViewModel: StepTrackerViewModel(),
            healthKitViewModel: HealthKitViewModel()
        )
    }
}

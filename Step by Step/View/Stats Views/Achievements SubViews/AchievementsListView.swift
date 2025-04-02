//
//  AchievementsListView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

struct AchievementsListView: View {
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    @ObservedObject var healthKitViewModel: HealthKitViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                
                // MARK: - Story Achievements Section with Single Link Card
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

                // MARK: - Steps In A Day
                AchievementSectionView(
                    title: "Steps In A Day",
                    achievements: achievementsViewModel.stepsInADayMilestones.map { milestone in
                        let isUnlocked = achievementsViewModel.achievements.stepsInADayAchievementUnlocked.contains(milestone)
                        let currentSteps = healthKitViewModel.hkCurrentStepsCount

                        let firstDate = stepTrackerViewModel.sortedStepData().first(where: { $0.steps >= milestone })?.date

                        let stepsToGo = max(milestone - currentSteps, 0)
                        let stepsToGoText = isUnlocked ? nil : "Steps to go: \(stepsToGo.formatted())"

                        return (
                            "\(milestone.formatted()) Steps",
                            "Walk \(milestone.formatted()) steps in a single day",
                            isUnlocked,
                            isUnlocked ? firstDate : nil,
                            stepsToGoText
                        )
                    }
                )

                // MARK: - Total Steps Taken
                AchievementSectionView(
                    title: "Total Steps Taken",
                    achievements: achievementsViewModel.totalStepsMilestones.map { milestone in
                        let isUnlocked = achievementsViewModel.achievements.totalStepsAchievementUnlocked.contains(milestone)
                        let totalSteps = stepTrackerViewModel.sortedStepData().reduce(0) { $0 + $1.steps }

                        let date = isUnlocked ? stepTrackerViewModel.sortedStepData().first(where: { $0.steps >= milestone })?.date : nil

                        let stepsToGoValue = max(milestone - totalSteps, 0)
                        let stepsToGoText = isUnlocked ? nil : "Steps to go: \(stepsToGoValue.formatted())"

                        return (
                            "\(milestone.formatted()) Steps",
                            "Walk \(milestone.formatted()) steps total",
                            isUnlocked,
                            date,
                            stepsToGoText
                        )
                    }
                )

                // MARK: - Total Distance Traveled
                AchievementSectionView(
                    title: "Total Distance Traveled",
                    achievements: achievementsViewModel.totalDistanceMilestones.map { milestone in
                        let isUnlocked = achievementsViewModel.achievements.totalDistanceAchievementUnlocked.contains(milestone)
                        let totalSteps = stepTrackerViewModel.sortedStepData().reduce(0) { $0 + $1.steps }
                        let totalDistance = Double(totalSteps) * 0.0005 // ≈ 2000 steps per mile

                        let date = isUnlocked ? stepTrackerViewModel.sortedStepData().first(where: { Double($0.steps) * 0.0005 >= milestone })?.date : nil

                        let milesToGoValue = max(milestone - totalDistance, 0)
                        let milesToGoText = isUnlocked ? nil : "Miles to go: \(milesToGoValue.cleanMiles())"

                        return (
                            "\(milestone.cleanMiles()) Miles",
                            "Travel \(milestone.cleanMiles()) miles total",
                            isUnlocked,
                            date,
                            milesToGoText
                        )
                    }
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

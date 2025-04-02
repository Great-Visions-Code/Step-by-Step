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
                AchievementSectionView(title: "Steps In A Day", achievements:
                    achievementsViewModel.stepsInADayMilestones.map { milestone in
                        let isUnlocked = achievementsViewModel.achievements.stepsInADayAchievementUnlocked.contains(milestone)
                        let currentSteps = healthKitViewModel.hkCurrentStepsCount

                        let firstDate = stepTrackerViewModel.sortedStepData()
                            .first(where: { $0.steps >= milestone })?
                            .date

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
                        
                        let totalSoFar = stepTrackerViewModel.sortedStepData()
                        var runningTotal = 0
                        let firstDate = totalSoFar.first {
                            runningTotal += $0.steps
                            return runningTotal >= milestone
                        }?.date
                        
                        return (
                            "\(milestone.formatted()) Steps",
                            "Walk \(milestone.formatted()) steps total",
                            isUnlocked,
                            isUnlocked ? firstDate : nil ,
                            nil
                        )
                    }
                )

                // MARK: - Total Distance Traveled
                AchievementSectionView(
                    title: "Total Distance Traveled",
                    achievements: achievementsViewModel.totalDistanceMilestones.map { milestone in
                        let isUnlocked = achievementsViewModel.achievements.totalDistanceAchievementUnlocked.contains(milestone)
                        
                        let totalSoFar = stepTrackerViewModel.sortedStepData()
                        var runningTotalSteps = 0
                        let firstDate = totalSoFar.first {
                            runningTotalSteps += $0.steps
                            let miles = Double(runningTotalSteps) * 0.0005
                            return miles >= milestone
                        }?.date
                        
                        return (
                            "\(milestone.cleanMiles()) Miles",
                            "Travel \(milestone.cleanMiles()) miles total",
                            isUnlocked,
                            isUnlocked ? firstDate : nil,
                            nil
                        )
                    }
                )
            }
            .padding(.horizontal)
            .padding(.top, 16)
        }
    }
}

// MARK: - Formatters
extension Int {
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

extension Double {
    func cleanMiles() -> String {
        self == floor(self) ? String(format: "%.0f", self) : String(format: "%.1f", self)
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

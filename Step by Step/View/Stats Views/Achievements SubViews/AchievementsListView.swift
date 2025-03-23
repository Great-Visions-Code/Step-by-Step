//
//  AchievementsListView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

struct AchievementsListView: View {
    @ObservedObject var achievementsViewModel: AchievementsViewModel

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
                        (
                            "\(milestone.formatted()) Steps",
                            "Walk \(milestone.formatted()) steps in a single day",
                            achievementsViewModel.achievements.stepsInADayAchievementUnlocked.contains(milestone)
                        )
                    }
                )

                // MARK: - Total Steps Taken
                AchievementSectionView(title: "Total Steps Taken", achievements:
                    achievementsViewModel.totalStepsMilestones.map { milestone in
                        (
                            "\(milestone.formatted()) Steps",
                            "Walk \(milestone.formatted()) steps total",
                            achievementsViewModel.achievements.totalStepsAchievementUnlocked.contains(milestone)
                        )
                    }
                )

                // MARK: - Total Distance Traveled
                AchievementSectionView(title: "Total Distance Traveled", achievements:
                    achievementsViewModel.totalDistanceMilestones.map { milestone in
                        (
                            "\(milestone.cleanMiles()) Miles",
                            "Travel \(milestone.cleanMiles()) miles total",
                            achievementsViewModel.achievements.totalDistanceAchievementUnlocked.contains(milestone)
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
        AchievementsListView(achievementsViewModel: AchievementsViewModel())
    }
}

#Preview {
    AchievementsListView(
        achievementsViewModel: AchievementsViewModel()
    )
}

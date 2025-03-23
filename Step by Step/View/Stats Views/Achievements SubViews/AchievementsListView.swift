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
                // MARK: - Survive Achievements (Static for now)
                AchievementSectionView(title: "Survive Achievements", achievements: [
                    ("Survive Day 1", "Complete Day 1", true),
                    ("Survive Day 2", "Complete Day 2", false),
                    ("Survive Day 3", "Complete Day 3", false),
                    ("Survive Day 4", "Complete Day 4", false),
                    ("Survive Day 5", "Complete Day 5", false)
                    ]
                )

                // MARK: - Steps In A Day
                AchievementSectionView(title: "Steps In A Day", achievements:
                    achievementsViewModel.stepsInADayMilestones.map { milestone in
                        ("\(milestone.formatted()) Steps",
                        "Walk \(milestone.formatted()) steps in a single day",
                        achievementsViewModel.achievements.stepsInADayAchievementUnlocked.contains(milestone)
                        )
                    }
                )

                // MARK: - Total Steps Taken
                AchievementSectionView(title: "Total Steps Taken", achievements:
                    achievementsViewModel.totalStepsMilestones.map { milestone in
                        ("\(milestone.formatted()) Steps",
                        "Walk \(milestone.formatted()) steps total",
                        achievementsViewModel.achievements.totalStepsAchievementUnlocked.contains(milestone)
                        )
                    }
                )

                // MARK: - Total Distance Traveled
                AchievementSectionView(title: "Total Distance Traveled", achievements:
                    achievementsViewModel.totalDistanceMilestones.map { milestone in
                        ("\(milestone.cleanMiles()) Miles",
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

extension Int {
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

extension Double {
    func cleanMiles() -> String {
        if self == floor(self) {
            return String(format: "%.0f", self)
        } else {
            return String(format: "%.1f", self)
        }
    }
}

#Preview {
    AchievementsListView(
        achievementsViewModel: AchievementsViewModel()
    )
}

//
//  AchievementSectionView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// A reusable section view that groups a list of achievements under a titled header.
///
/// Used to visually organize achievements by category (e.g., "Steps In A Day", "Total Distance Traveled").
/// Accepts a list of `AchievementCardItems` and renders them using `AchievementCardView`.
struct AchievementSectionView: View {
    /// The title shown above the section (e.g., "Steps In A Day").
    var title: String

    /// The list of achievements to display in the section.
    var achievements: [AchievementCardItems]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Section Title
            Text(title)
                .font(.headline)
                .foregroundStyle(.gray)
                .padding(.top, 16)

            // Render each achievement as a card
            ForEach(achievements) { achievement in
                AchievementCardView(
                    achievementCardItems: AchievementCardItems(
                        title: achievement.title,
                        description: achievement.description,
                        isCompleted: achievement.isCompleted,
                        dateEarned: achievement.dateEarned,
                        progressNote: achievement.progressNote
                    )
                )
            }
        }
    }
}

#Preview {
    AchievementSectionView(
        title: "Steps In A Day",
        achievements: [
            AchievementCardItems(
                title: "5,000",
                description: "Walk 5,000 steps in a single day",
                isCompleted: true,
                dateEarned: "03/01/25",
                progressNote: nil
            ),
            AchievementCardItems(
                title: "Survive Day 2",
                description: "Complete Day 2",
                isCompleted: false,
                dateEarned: nil,
                progressNote: "Steps to go: 5,000"
            ),
            AchievementCardItems(
                title: "Survive Day 3",
                description: "Complete Day 3",
                isCompleted: false,
                dateEarned: nil,
                progressNote: "Steps to go: 10,000"
            )
        ]
    )
}

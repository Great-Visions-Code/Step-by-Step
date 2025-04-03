//
//  StoryAchievementsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/9/24.
//

import SwiftUI

/// Displays story-related achievements, focusing on milestones in the "Survive" storyline.
struct StoryAchievementsView: View {
    @ObservedObject var achievementsViewModel: AchievementsViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                // MARK: - Survive Achievements
                AchievementSectionView(
                    title: "Survive Achievements",
                    achievements: [
                        AchievementCardItems(
                            title: "Survive Day 1",
                            description: "Complete Day 1",
                            isCompleted: achievementsViewModel.isStoryDayAchievementUnlocked(1),
                            dateEarned: nil,
                            progressNote: nil
                        ),
                        AchievementCardItems(
                            title: "Survive Day 2",
                            description: "Complete Day 2",
                            isCompleted: achievementsViewModel.isStoryDayAchievementUnlocked(2),
                            dateEarned: nil,
                            progressNote: nil
                        ),
                        AchievementCardItems(
                            title: "Survive Day 3",
                            description: "Complete Day 3",
                            isCompleted: achievementsViewModel.isStoryDayAchievementUnlocked(3),
                            dateEarned: nil,
                            progressNote: nil
                        ),
                        AchievementCardItems(
                            title: "Survive Day 4",
                            description: "Complete Day 4",
                            isCompleted: achievementsViewModel.isStoryDayAchievementUnlocked(4),
                            dateEarned: nil,
                            progressNote: nil
                        ),
                        AchievementCardItems(
                            title: "Survive Day 5",
                            description: "Complete Day 5",
                            isCompleted: achievementsViewModel.isStoryDayAchievementUnlocked(5),
                            dateEarned: nil,
                            progressNote: nil
                        )
                    ]
                )
            }
            .padding(.horizontal)
            .padding(.top, 16)
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    StoryAchievementsView(achievementsViewModel: AchievementsViewModel())
}

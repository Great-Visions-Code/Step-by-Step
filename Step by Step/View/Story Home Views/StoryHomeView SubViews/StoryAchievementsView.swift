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
                AchievementSectionView(title: "Survive Achievements", achievements: [
                    ("Survive Day 1", "Complete Day 1", achievementsViewModel.isStoryDayAchievementUnlocked(1), nil),
                    ("Survive Day 2", "Complete Day 2", achievementsViewModel.isStoryDayAchievementUnlocked(2), nil),
                    ("Survive Day 3", "Complete Day 3", achievementsViewModel.isStoryDayAchievementUnlocked(3), nil),
                    ("Survive Day 4", "Complete Day 4", achievementsViewModel.isStoryDayAchievementUnlocked(4), nil),
                    ("Survive Day 5", "Complete Day 5", achievementsViewModel.isStoryDayAchievementUnlocked(5), nil)
                ])
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

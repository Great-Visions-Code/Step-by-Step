//
//  StoryAchievementsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/9/24.
//

import SwiftUI

/// Displays story-related achievements, focusing on milestones in the "Survive" storyline.
struct StoryAchievementsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 12) { // Controls spacing between sections
                    
                    // MARK: - Survive Achievements
                    VStack(spacing: 12) {
                        AchievementSectionView(title: "Survive Achievements", achievements: [
                            ("Survive Day 1", "Complete Day 1", true),
                            ("Survive Day 2", "Complete Day 2", false),
                            ("Survive Day 3", "Complete Day 3", false),
                            ("Survive Day 4", "Complete Day 4", false),
                            ("Survive Day 5", "Complete Day 5", false)
                        ])
                    }
                }
                .padding(.horizontal)
                .padding(.top, 16)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Story Achievements")
        }
    }
}

#Preview {
    StoryAchievementsView()
}

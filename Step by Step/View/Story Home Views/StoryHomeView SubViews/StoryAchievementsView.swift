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
                    Text("Survive Achievements")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 16)
                    
                    VStack(spacing: 12) {
                        AchievementRowView(title: "Survive Day 1", description: "Complete Day 1", isCompleted: true)
                        AchievementRowView(title: "Survive Day 2", description: "Complete Day 2", isCompleted: false)
                        AchievementRowView(title: "Survive Day 3", description: "Complete Day 3", isCompleted: false)
                        AchievementRowView(title: "Survive Day 4", description: "Complete Day 4", isCompleted: false)
                        AchievementRowView(title: "Survive Day 5", description: "Complete Day 5", isCompleted: false)
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

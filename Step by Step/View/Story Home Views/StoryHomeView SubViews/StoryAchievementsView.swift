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
            List {
                Section(header: Text("Survive Achievements").font(.headline)) {
                    AchievementRowView(title: "Survive Day 1", description: "Complete Day 1", isCompleted: true)
                    AchievementRowView(title: "Survive Day 2", description: "Complete Day 2", isCompleted: false)
                    AchievementRowView(title: "Survive Day 3", description: "Complete Day 3", isCompleted: false)
                    AchievementRowView(title: "Survive Day 4", description: "Complete Day 4", isCompleted: false)
                    AchievementRowView(title: "Survive Day 5", description: "Complete Day 5", isCompleted: false)
                }
            }
            .navigationTitle("Story Achievements")
        }
    }
}

#Preview {
    StoryAchievementsView()
}

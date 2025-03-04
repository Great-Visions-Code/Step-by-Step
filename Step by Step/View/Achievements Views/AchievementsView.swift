//
//  AchievementsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// View displaying user achievements categorized into different sections.
struct AchievementsView: View {
    var body: some View {
        NavigationView {
            List {
                // MARK: - Survive Achievements
                Section(header: Text("Survive Achievements").font(.headline)) {
                    AchievementRowView(title: "Survive Day 1", description: "Complete Day 1", isCompleted: true)
                    AchievementRowView(title: "Survive Day 2", description: "Complete Day 2", isCompleted: false)
                    AchievementRowView(title: "Survive Day 2", description: "Complete Day 3", isCompleted: false)
                    AchievementRowView(title: "Survive Day 2", description: "Complete Day 4", isCompleted: false)
                    AchievementRowView(title: "Survive Day 2", description: "Complete Day 5", isCompleted: false)
                }

                // MARK: - Total Steps Taken
                Section(header: Text("Total Steps Taken").font(.headline)) {
                    AchievementRowView(title: "1,000 Steps", description: "Walk 1,000 steps", isCompleted: false)
                    AchievementRowView(title: "2,500 Steps", description: "Walk 2,500 steps", isCompleted: false)
                    AchievementRowView(title: "5,000 Steps", description: "Walk 5,000 steps", isCompleted: false)
                    AchievementRowView(title: "10,000 Steps", description: "Walk 10,000 steps", isCompleted: false)
                    AchievementRowView(title: "20,000 Steps", description: "Walk 20,000 steps", isCompleted: false)
                    AchievementRowView(title: "50,000 Steps", description: "Walk 50,000 steps", isCompleted: false)
                    AchievementRowView(title: "100,000 Steps", description: "Walk 100,000 steps", isCompleted: false)
                    AchievementRowView(title: "250,000 Steps", description: "Walk 250,000 steps", isCompleted: false)
                    AchievementRowView(title: "500,000 Steps", description: "Walk 500,000 steps", isCompleted: false)
                    AchievementRowView(title: "1,000,000 Steps", description: "Walk 1,000,000 steps", isCompleted: false)
                }

                // MARK: - Total Distance Traveled
                Section(header: Text("Total Distance Traveled").font(.headline)) {
                    AchievementRowView(title: "1 Mile", description: "Travel 1 mile", isCompleted: false)
                    AchievementRowView(title: "2 Miles", description: "Travel 2 miles", isCompleted: false)
                    AchievementRowView(title: "4 Miles", description: "Travel 4 miles", isCompleted: false)
                    AchievementRowView(title: "5 Miles", description: "Travel 5 miles", isCompleted: false)
                    AchievementRowView(title: "10 Miles", description: "Travel 10 miles", isCompleted: false)
                    AchievementRowView(title: "25 Miles", description: "Travel 25 miles", isCompleted: false)
                    AchievementRowView(title: "50 Miles", description: "Travel 50 miles", isCompleted: false)
                    AchievementRowView(title: "100 Miles", description: "Travel 100 miles", isCompleted: false)
                    AchievementRowView(title: "250 Miles", description: "Travel 250 miles", isCompleted: false)
                    AchievementRowView(title: "500 Miles", description: "Travel 500 miles", isCompleted: false)
                    AchievementRowView(title: "750 Miles", description: "Travel 750 miles", isCompleted: false)
                    AchievementRowView(title: "1000 Miles", description: "Travel 1000 miles", isCompleted: false)
                }
            }
            .navigationTitle("Achievements")
        }
    }
}

#Preview {
    AchievementsView()
}

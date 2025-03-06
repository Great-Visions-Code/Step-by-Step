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
                    
                    // MARK: - Total Steps Taken
                    Text("Total Steps Taken")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 16)
                    
                    VStack(spacing: 12) {
                        AchievementRowView(title: "1,000 Steps", description: "Walk 1,000 steps", isCompleted: false)
                        AchievementRowView(title: "10,000 Steps", description: "Walk 10,000 steps", isCompleted: false)
                        AchievementRowView(title: "100,000 Steps", description: "Walk 100,000 steps", isCompleted: false)
                    }
                    
                    // MARK: - Total Distance Traveled
                    Text("Total Distance Traveled ")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 16)
                    
                    VStack(spacing: 12) {
                        AchievementRowView(title: "1 Mile", description: "Travel 1 mile", isCompleted: false)
                        AchievementRowView(title: "10 Miles", description: "Travel 10 miles", isCompleted: false)
                        AchievementRowView(title: "100 Miles", description: "Travel 100 miles", isCompleted: false)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 16)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Achievements")
        }
    }
}

#Preview {
    AchievementsView()
}

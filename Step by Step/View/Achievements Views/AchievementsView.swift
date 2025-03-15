//
//  AchievementsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// View displaying user achievements and step activity, toggleable with tab buttons.
struct AchievementsView: View {
    /// State to track the selected tab: Achievements or Step Activity
    @State private var selectedTab: AchievementTab = .achievements

    var body: some View {
        NavigationView {
            VStack {
                // MARK: - Custom Segmented Control
                HStack {
                    TabButtonView(title: "Achievements", isSelected: selectedTab == .achievements) {
                        selectedTab = .achievements
                    }
                    
                    TabButtonView(title: "Step Activity", isSelected: selectedTab == .stepActivity) {
                        selectedTab = .stepActivity
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                // MARK: - Content Switching Based on Selected Tab
                ScrollView {
                    if selectedTab == .achievements {
                        AchievementsListView()
                    } else {
                        StepActivityView()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 16)
            }
            .background(Color(.systemGroupedBackground))
        }
    }
}

/// Enum for tab selection
enum AchievementTab {
    case achievements
    case stepActivity
}

/// **Achievements List**
struct AchievementsListView: View {
    var body: some View {
        VStack(spacing: 12) {
            AchievementSection(title: "Survive Achievements", achievements: [
                ("Survive Day 1", "Complete Day 1", true),
                ("Survive Day 2", "Complete Day 2", false),
                ("Survive Day 3", "Complete Day 3", false),
                ("Survive Day 4", "Complete Day 4", false),
                ("Survive Day 5", "Complete Day 5", false)
            ])

            AchievementSection(title: "Total Steps Taken", achievements: [
                ("10,000 Steps", "Walk 10,000 steps", false),
                ("100,000 Steps", "Walk 100,000 steps", false)
            ])

            AchievementSection(title: "Total Distance Traveled", achievements: [
                ("1 Mile", "Travel 1 mile", false),
                ("10 Miles", "Travel 10 miles", false)
            ])
        }
    }
}

/// **Reusable Achievement Section**
struct AchievementSection: View {
    var title: String
    var achievements: [(String, String, Bool)]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 16)

            ForEach(achievements, id: \.0) { achievement in
                AchievementRowView(
                    title: achievement.0,
                    description: achievement.1,
                    isCompleted: achievement.2
                )
            }
        }
    }
}

#Preview {
    AchievementsView()
}

//
//  AchievementsListView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// **Achievements List**
struct AchievementsListView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 12) {
                AchievementSectionView(title: "Survive Achievements", achievements: [
                    ("Survive Day 1", "Complete Day 1", true),
                    ("Survive Day 2", "Complete Day 2", false),
                    ("Survive Day 3", "Complete Day 3", false),
                    ("Survive Day 4", "Complete Day 4", false),
                    ("Survive Day 5", "Complete Day 5", false)
                ])
                
                AchievementSectionView(title: "Total Steps Taken", achievements: [
                    ("10,000 Steps", "Walk 10,000 steps", true),
                    ("100,000 Steps", "Walk 100,000 steps", false)
                ])
                
                AchievementSectionView(title: "Total Distance Traveled", achievements: [
                    ("1 Mile", "Travel 1 mile", false),
                    ("10 Miles", "Travel 10 miles", false)
                ])
            }
        }
        .padding(.horizontal)
        .padding(.top, 16)
    }
}

#Preview {
    AchievementsListView()
}

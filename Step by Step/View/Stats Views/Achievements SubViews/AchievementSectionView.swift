//
//  AchievementSectionView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// **Reusable Achievement Section**
struct AchievementSectionView: View {
    var title: String
    var achievements: [(String, String, Bool, String?, String?)]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.gray)
                .padding(.top, 16)

            ForEach(achievements, id: \.0) { achievement in
                AchievementCardView(
                    title: achievement.0,
                    description: achievement.1,
                    isCompleted: achievement.2,
                    dateEarned: achievement.3,
                    stepsToGo: achievement.4
                )
            }
        }
    }
}

#Preview {
    AchievementSectionView(
        title: "Steps In A Day",
        achievements: [
            ("5,000", "Walk 5,000 steps in a single day", true, "03/01/25", nil),
            ("Survive Day 2", "Complete Day 2", false, nil, "5000"),
            ("Survive Day 3", "Complete Day 3", false, nil, "10000")
        ]
    )
}

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
    var achievements: [(String, String, Bool)]

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
                    isCompleted: achievement.2
                )
            }
        }
    }
}

#Preview {
    AchievementSectionView(title: "Survive Achievements",
                       achievements: [
                        ("Survive Day 1", "Complete Day 1", true),
                        ("Survive Day 2", "Complete Day 2", false),
                        ("Survive Day 3", "Complete Day 3", false)
                       ]
    )
}

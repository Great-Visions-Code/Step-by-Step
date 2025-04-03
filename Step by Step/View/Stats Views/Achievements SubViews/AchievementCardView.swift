//
//  AchievementCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/3/25.
//

import SwiftUI

/// A single card view displaying an achievement's status, description, and optional metadata.
///
/// This view presents the achievement with a status icon, title, description,
/// optional progress note (e.g., "Steps to go: 3,000"), and the date it was earned.
/// Completed achievements are visually distinguished by color and an additional label.
struct AchievementCardView: View {
    /// A structured representation of the achievement to be displayed.
    let achievementCardItems: AchievementCardItems

    /// Automatically adapts to the system's light/dark mode for color styling.
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(spacing: 15) {
            // MARK: - Completion Status Icon
            Image(systemName: achievementCardItems.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(achievementCardItems.isCompleted ? .blue : .gray)
                .font(.title2)

            // MARK: - Textual Details
            VStack(alignment: .leading, spacing: 4) {
                // Title (e.g., "5,000 Steps")
                Text(achievementCardItems.title)
                    .font(.headline)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)

                // Description (e.g., "Walk 5,000 steps in a single day")
                Text(achievementCardItems.description)
                    .font(.subheadline)
                    .foregroundStyle(.gray)

                // Optional progress note if not yet completed
                if let progress = achievementCardItems.progressNote {
                    Text(progress)
                        .font(.footnote)
                        .foregroundStyle(.blue)
                }

                // Optional completion date
                if let dateEarned = achievementCardItems.dateEarned {
                    Text("Date Earned: \(dateEarned)")
                        .font(.footnote)
                        .foregroundStyle(.blue)
                }
            }

            Spacer()

            // MARK: - Completed Label
            if achievementCardItems.isCompleted {
                Text("Completed")
                    .font(.footnote)
                    .foregroundStyle(.blue)
            }
        }
        .padding()
        .background(colorScheme == .dark ? Color.black : Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
    }
}

#Preview {
    AchievementCardView(
        achievementCardItems: AchievementCardItems(
            title: "5,000 Steps",
            description: "Walk 5,000 steps in a single day",
            isCompleted: true,
            dateEarned: "04/01/25",
            progressNote: nil
        )
    )
}

//
//  AchievementCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/3/25.
//

import SwiftUI

/// A single achievement row with an icon, title, and completion status.
struct AchievementCardView: View {
    var title: String
    var description: String
    var isCompleted: Bool
    var dateEarned: String?
    var stepsToGo: String?

    /// Dynamically adjust colors based on system theme
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(spacing: 15) {
            // Achievement Icon
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(isCompleted ? .blue : .gray)
                .font(.title2)

            // Achievement Details
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(colorScheme == .dark ? .white : .black) // Adjust for Dark Mode
                
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                if let stepsToGo = stepsToGo {
                    Text(stepsToGo)
                        .font(.footnote)
                        .foregroundStyle(.blue)
                }
                
                if let dateEarned = dateEarned {
                    Text("Date Earned: \(dateEarned)")
                        .font(.footnote)
                        .foregroundStyle(.blue)
                }
            }

            Spacer()

            // Completed Label
            if isCompleted {
                Text("Completed")
                    .font(.footnote)
                    .foregroundStyle(.blue)
            }
        }
        .padding()
        .background(colorScheme == .dark ? Color.black : Color.white) // Adjust background for Dark Mode
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1) // Subtle shadow
    }
}

#Preview {
    AchievementCardView(title: "5,000 Steps",
        description: "Walk 5,000 steps in a single day",
        isCompleted: true,
        dateEarned: "01/02/25",
        stepsToGo: "(Steps to go: 14,576)"
    )
}

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

    /// Dynamically adjust colors based on system theme
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(spacing: 15) {
            // Achievement Icon
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isCompleted ? .blue : .gray)
                .font(.title2)

            // Achievement Details
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(colorScheme == .dark ? .white : .black) // Adjust for Dark Mode
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            // Completed Label
            if isCompleted {
                Text("Completed")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(colorScheme == .dark ? Color.black : Color.white) // Adjust background for Dark Mode
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1) // Subtle shadow
    }
}

#Preview {
    AchievementCardView(title: "Achievement Title",
                   description: "Whats needed to complete",
                   isCompleted: true
    )
}

//
//  AchievementRowView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/3/25.
//

import SwiftUI

/// A single achievement row with an icon, title, and completion status.
struct AchievementRowView: View {
    var title: String
    var description: String
    var isCompleted: Bool

    var body: some View {
        HStack(spacing: 15) {
            // Achievement Icon
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isCompleted ? .green : .gray)
                .font(.title2)

            // Achievement Details
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            // Completed Label
            if isCompleted {
                Text("Completed")
                    .font(.footnote)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color.white) // Card background
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1) // Subtle shadow
    }
}

#Preview {
    AchievementRowView(title: "Achievement Title",
                   description: "Whats needed to complete",
                   isCompleted: true
    )
}

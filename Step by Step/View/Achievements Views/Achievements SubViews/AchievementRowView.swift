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
        HStack {
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(isCompleted ? .green : .gray)
                .font(.title2)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            if isCompleted {
                Text("Completed")
                    .font(.footnote)
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    AchievementRowView(title: "Achievement Title",
                   description: "Whats needed to complete",
                   isCompleted: true
    )
}

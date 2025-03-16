//
//  AchievementsTabView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/14/25.
//

import SwiftUI

/// **Reusable Tab Button**
struct AchievementsTabView: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, minHeight: 44)
                .background(isSelected ? Color.blue : Color.clear)
                .foregroundColor(isSelected ? .white : .gray)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: isSelected ? 0 : 1)
                )
        }
    }
}

#Preview {
    AchievementsTabView(
        title: "Title",
        isSelected: true,
        action: {}
    )
}

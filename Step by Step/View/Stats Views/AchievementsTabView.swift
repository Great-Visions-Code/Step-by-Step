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
                .foregroundStyle(isSelected ? .white : .gray)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: isSelected ? 0 : 1)
                )
        }
    }
}

#Preview {
    AchievementsTabView(
        title: "Step Activity",
        isSelected: false,
        action: {}
    )
}

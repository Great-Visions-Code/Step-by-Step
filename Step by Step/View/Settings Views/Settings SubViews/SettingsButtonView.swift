//
//  SettingsButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 7/27/25.
//

import SwiftUI

/// A reusable settings-style button designed for the app's Settings screen.
///
/// This view presents a title, optional subtitle, a leading SF Symbol icon, and a trailing chevron,
/// all styled with consistent padding, background, and rounded corners. It executes a provided action when tapped.
struct SettingsButtonView: View {
    
    /// The main label displayed on the button.
    let title: String
    
    /// An optional secondary label displayed below the title.
    let subtitle: String?
    
    /// The name of the SF Symbol icon to display on the leading side.
    let icon: String
    
    /// The action to perform when the button is tapped.
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.title2)
                    .frame(width: 30)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white.opacity(0.9))
            }
            .padding()
        }
        .frame(width: 352, height: 68)
        .background(.blue.opacity(0.95))
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                .blendMode(.overlay)
        )
    }
}

#Preview {
    VStack(spacing: 16) {
        SettingsButtonView(
            title: "Daily Step Goal",
            subtitle: "5000 Steps",
            icon: "figure.walk",
            action: { }
        )
        
        SettingsButtonView(
            title: "Developer Testing",
            subtitle: "Adjust stats",
            icon: "wrench.and.screwdriver",
            action: {}
        )
    }
    .padding()
    .background(Color(.systemBackground))
}

#Preview {
    SettingsView(
        playerStatsViewModel: PlayerStatsViewModel(),
        stepTrackerViewModel: StepTrackerViewModel(),
        achievementsViewModel: AchievementsViewModel()
    )
}

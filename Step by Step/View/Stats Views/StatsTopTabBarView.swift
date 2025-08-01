//
//  StatsTopTabBarView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/14/25.
//

import SwiftUI

/// A stylized segmented tab used in `StatsNavigationView` for switching between step activity and achievements views.
///
/// This tab displays an icon and a title stacked vertically. The selected state is visually emphasized
/// using a colored background, bold text, and a subtle scaling animation for interactivity.
///
/// - Parameters:
///   - title: The tab's label text.
///   - systemImage: The SF Symbol name representing the tab icon.
///   - isSelected: Whether this tab is currently selected.
///   - action: Callback triggered when the tab is tapped.
struct StatsTopTabBarView: View {
    var title: String
    var systemImage: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                // Tab icon
                Image(systemName: systemImage)
                    .font(.system(size: 16, weight: .semibold))

                // Tab label
                Text(title)
                    .font(.caption2)
                    .fontWeight(isSelected ? .bold : .regular)
            }
            .frame(maxWidth: .infinity, minHeight: 36)
            .padding(.vertical, 4)

            // Dynamic foreground color based on selection
            .foregroundStyle(isSelected ? .white : .secondary)

            // Background uses blue fill if selected, soft gray if not
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.blue : Color.gray.opacity(0.05))
            )

            // Subtle border to separate tab segments
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color.primary.opacity(0.15), lineWidth: 1)
            )

            // Scale up selected tab slightly for emphasis
            .scaleEffect(isSelected ? 1.06 : 1.0)

            // Smooth, springy transition when switching selection
            .animation(.spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0.2), value: isSelected)
        }
        // Disable button tap animation styling to keep transitions clean
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack(spacing: 20) {
        StatsTopTabBarView(title: "Steps",
                           systemImage: "shoeprints.fill",
                           isSelected: true,
                           action: {}
        )
        
        StatsTopTabBarView(title: "Milestones",
                           systemImage: "rosette",
                           isSelected: false,
                           action: {}
        )
    }
    .padding(.horizontal)
    .padding(.top, 8)
}

#Preview("DashboarView") {
    let previewAchievementsViewModel = AchievementsViewModel()
    let previewStepTrackerViewModel = StepTrackerViewModel()
    let previewStoryCardViewModel = StoryCardViewModel()
    let previewPlayerStatsViewModel = PlayerStatsViewModel()
    
    DashboardView(
        stepTrackerViewModel: previewStepTrackerViewModel,
        achievementsViewModel: previewAchievementsViewModel,
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: previewAchievementsViewModel,
            playerStatsViewModel: previewPlayerStatsViewModel
        ),
        playerStatsViewModel: previewPlayerStatsViewModel,
        storyCardViewModel: previewStoryCardViewModel
    )
}

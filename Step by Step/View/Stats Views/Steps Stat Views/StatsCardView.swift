//
//  StatsCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// A reusable visual card that displays small step-related stats like streaks, best day, and averages.
///
/// This card is used in the `StepsStatsView` to show contextual metrics in a compact form.
/// The layout includes a title, value, and optional subStat (e.g., a date or supporting info).
///
/// Example use cases:
/// - "Best Day" with a step count and date
/// - "7-Day Avg" with just a number
/// - "Streak" with a pluralized day count
struct StatsCardView: View {
    
    /// Title displayed at the top of the card (e.g., "Streak")
    var title: String
    
    /// Main value (e.g., "4 days", "7,412", etc.)
    var value: String
    
    /// Optional subStat text (e.g., a date like "Jul 18")
    var subStat: String?
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Background style and shape
            CardView()
            
            VStack(alignment: .leading, spacing: 8) {
                // Top label
                Text(title)
                    .font(AppStyle.Card.subtitleFont)
                    .foregroundStyle(AppStyle.Colors.secondaryText)
                
                // Primary value
                Text(value)
                    .font(AppStyle.Card.statFont)
                
                Spacer()
                
                // Optional bottom label (e.g., date)
                Text(subStat ?? "")
                    .font(AppStyle.Card.subStatFont)
                    .foregroundStyle(AppStyle.Colors.secondaryText)
            }
            .padding()
        }
        .frame(width: 122, height: 118) // Fixed card size for layout consistency
    }
}

#Preview {
    // Single preview card
    StatsCardView(
        title: "Best Day",
        value: "14,115",
        subStat: "Jul 18"
    )
}

#Preview("Cards") {
    // Preview of three example cards side-by-side
    HStack(spacing: 16) {
        StatsCardView(
            title: "Current Streak",
            value: "4 days"
        )
        StatsCardView(
            title: "Best Day",
            value: "14,115"
        )
        StatsCardView(
            title: "7-day avg",
            value: "5,877"
        )
    }
    .padding()
}

#Preview("DashboardView") {
    // Full DashboardView preview with dependencies
    let previewAchievementsViewModel = AchievementsViewModel()
    let previewStepTrackerViewModel = StepTrackerViewModel()
    let previewStoryCardViewModel = StoryCardViewModel()
    let previewPlayerStatsViewModel = PlayerStatsViewModel()
    
    return DashboardView(
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

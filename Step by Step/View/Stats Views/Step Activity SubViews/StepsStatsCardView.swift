//
//  StepsStatsCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// A reusable visual card that displays small step-related stats like streaks, best day, and averages.
///
/// This card is used in the `StatsView` to show contextual metrics in a compact form.
/// The layout includes a title, value, and optional subheading (e.g., a date or supporting info).
///
/// Example use cases:
/// - "Best Day" with a step count and date
/// - "7-Day Avg" with just a number
/// - "Streak" with a pluralized day count
struct StepsStatsCardView: View {
    
    /// Title displayed at the top of the card (e.g., "Streak")
    var title: String
    
    /// Main value (e.g., "4 days", "7,412", etc.)
    var value: String
    
    /// Optional subheading text (e.g., a date like "Jul 18")
    var subheading: String?
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Background style and shape
            Rectangle()
                .foregroundStyle(.wave3)
                .opacity(0.25)
                .clipShape(RoundedRectangle(cornerRadius: AppStyle.cornerRadius))
            
            VStack(alignment: .leading, spacing: 6) {
                // Top label
                Text(title)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                // Primary value
                Text(value)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                // Optional bottom label (e.g., date)
                Text(subheading ?? "")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .frame(width: 122, height: 118) // Fixed card size for layout consistency
    }
}

#Preview {
    // Single preview card
    StepsStatsCardView(
        title: "Best Day",
        value: "14,115",
        subheading: "Jul 18"
    )
}

#Preview("Cards") {
    // Preview of three example cards side-by-side
    HStack(spacing: 16) {
        StepsStatsCardView(
            title: "Current Streak",
            value: "4 days"
        )
        StepsStatsCardView(
            title: "Best Day",
            value: "14,115"
        )
        StepsStatsCardView(
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

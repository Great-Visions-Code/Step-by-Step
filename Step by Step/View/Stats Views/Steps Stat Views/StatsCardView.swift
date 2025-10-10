//
//  StatsCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// Direction of change for a stat (used by the tiny "ticker" UI).
enum TrendDirection {
    case up, down, flat
}

struct StatsCardView: View {
    
    // MARK: - Inputs

    /// Title displayed at the top of the card (e.g., "Streak")
    var title: String

    /// Main value (e.g., "4 days", "7,412", etc.)
    var value: String

    /// Optional subStat text (e.g., a date like "Jul 18")
    var subStat: String?

    /// Optional trend indicator (arrow + color)
    var trend: TrendDirection? = nil

    /// Optional delta text to show next to the arrow (e.g., "+5%" or "−2%")
    var deltaText: String? = nil

    // MARK: - Private

    private var trendColor: Color {
        switch trend {
        case .up?:   return .green
        case .down?: return .red
        case .flat?: return .secondary
        case nil:    return .clear
        }
    }

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
                
                // Optional trend "ticker" row (small)
                if let trend {
                    HStack(spacing: 6) {
                        Image(systemName: "triangle.fill")
                            .rotationEffect(trend == .down ? .degrees(180) : .degrees(0))
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(trendColor)
                            .accessibilityHidden(true)
                        
                        Text(deltaText ?? (trend == .up ? "Up" : trend == .down ? "Down" : "No change"))
                            .font(AppStyle.Card.subStatFont)
                            .foregroundStyle(trendColor)
                            .accessibilityLabel(
                                trend == .up
                                ? "Up \(deltaText ?? "")"
                                : trend == .down
                                ? "Down \(deltaText ?? "")"
                                : "No change"
                            )
                    }
                } else {
                    // Optional bottom label (e.g., date)
                    Text(subStat ?? "")
                        .font(AppStyle.Card.subStatFont)
                        .foregroundStyle(AppStyle.Colors.secondaryText)
                }
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
            value: "14,115",
            subStat: "Jul 18"
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

//
//  StepsCardStatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// **Reusable Stat Box**
struct StepsCardStatsView: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundStyle(.white)
            
            Text(value)
                .font(.title3)
                .foregroundStyle(.white)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.blue)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    // MARK: - Distance & Goal Progress
    HStack(spacing: 16) {
        StepsCardStatsView(
            title: "DISTANCE",
            value: "2.1 mi"
        )
        StepsCardStatsView(
            title: "GOAL PROGRESS",
            value: "2%"
        )
    }
    .padding()
}

#Preview("DashboardView") {
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

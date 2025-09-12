//
//  StatsDashboardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// View displaying user achievements and step activity, toggleable with tab buttons.
struct StatsDashboardView: View {
    /// State to track the selected tab: Achievements or Step Activity
    @State private var selectedTab: AchievementTab = .stepActivity

    /// Enum for tab selection
    enum AchievementTab {
        case stepActivity
        case achievements
    }

    var body: some View {
        NavigationStack {
            ZStack {
                WaveBackground()
                
                VStack(spacing: 0) {
                    // MARK: - Content Switching Based on Selected Tab
                    if selectedTab == .stepActivity {
                        StatsView(
                            stepTrackerViewModel: StepTrackerViewModel()
                        )
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        AchievementsListView(
                            achievementsViewModel: AchievementsViewModel(),
                            stepTrackerViewModel: StepTrackerViewModel(),
                            healthKitViewModel: HealthKitViewModel()
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

#Preview {
    StatsDashboardView()
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

//
//  DashboardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

/// The main dashboard of the app, providing a tab-based navigation structure.
///
/// - Tabs:
///   1. Achievements: Displays user achievements and progress.
///   2. Home: The core gameplay and step-tracking interface.
///   3. Settings: Allows users to manage app preferences and configurations.
struct DashboardView: View {
    // ViewModel to manage step tracking across the app.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    // ViewModel to manage achievements.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    // ViewModel to manage story content.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    // ViewModel to manage player stats across the app.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    // ViewModel to manage story card content.
    @ObservedObject var storyCardViewModel: StoryCardViewModel
    
    /// Enum to represent each tab in `TabView`.
    enum TabSelection: String, Hashable {
        case achievements
        case home
        case settings
    }

    // Tracks the currently selected tab in the TabView.
    @State private var selectedTab: TabSelection = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            // Achievements tab for showcasing user accomplishments.
            StatsView()
            .tabItem {
                Image(systemName: "figure.walk")
                Text("Stats")
            }
            .tag(TabSelection.achievements)

            // Home tab: Story selection and steps conversion.
            HomeView(
                storyCardViewModel: storyCardViewModel,
                playerStatsViewModel: playerStatsViewModel,
                stepTrackerViewModel: stepTrackerViewModel,
                achievementsViewModel: achievementsViewModel,
                storyContentViewModel: storyContentViewModel
            )
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(TabSelection.home)

            // Settings tab for app configuration and user preferences.
            SettingsView(
                playerStatsViewModel: playerStatsViewModel,
                stepTrackerViewModel: stepTrackerViewModel,
                achievementsViewModel: achievementsViewModel
            )
            .tabItem {
                Image(systemName: "gearshape.2.fill")
                Text("Settings")
            }
            .tag(TabSelection.settings)
        }
    }
}

#Preview {
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

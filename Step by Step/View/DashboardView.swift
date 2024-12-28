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
    // ViewModel to manage player stats across the app.
    @StateObject private var playerStatsViewModel = PlayerStatsViewModel()
    // ViewModel to manage step tracking across the app.
    @StateObject private var stepTrackerViewModel = StepTrackerViewModel()
    // ViewModel to manage achievements.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    // ViewModel to manage story content.
    @ObservedObject var storyContentViewModel: StoryContentViewModel

    // Tracks the currently selected tab in the TabView.
    @State private var selectedTab: Int = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            // Achievements tab for showcasing user accomplishments.
            AchievementsView(
                achievementsViewModel: achievementsViewModel
            )
                .tabItem {
                    Image(systemName: "trophy.fill")
                    Text("Achievements")
                }
                .tag(0)

            // Home tab: Story selection and steps conversion.
            HomeView(
                storyViewModel: StoryTitleCardViewModel(),
                playerStatsViewModel: playerStatsViewModel,
                stepTrackerViewModel: stepTrackerViewModel,
                achievementsViewModel: achievementsViewModel,
                storyContentViewModel: storyContentViewModel
            )
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(1)

            // Settings tab for app configuration and user preferences.
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.2.fill")
                    Text("Settings")
                }
                .tag(2)
        }
    }
}

#Preview {
    // Shared instance of AchievementsViewModel for the preview.
    let previewAchievementsViewModel = AchievementsViewModel()
    
    DashboardView(
        achievementsViewModel: previewAchievementsViewModel,
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: previewAchievementsViewModel,
            playerStatsViewModel: PlayerStatsViewModel()
        )
    )
}

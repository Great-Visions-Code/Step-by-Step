//
//  DashboardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

struct DashboardView: View {
    // ViewModel for player stats
    @StateObject private var playerStatsViewModel = PlayerStatsViewModel()
    // Track the selected tab, defaulting to Home
    @State private var selectedTab: Int = 1

    var body: some View {
        // MARK: TabView for bottom navigation
        TabView(selection: $selectedTab) {
            // MARK: Achievements Tab
            AchievementsView()
                .tabItem {
                    Image(systemName: "trophy.fill")
                    Text("Achievements")
                }
                .tag(0)
            
            // MARK: Home Tab
            HomeView(
                storyViewModel: StoryTitleCardViewModel(),
                playerStatsViewModel: playerStatsViewModel
            )
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(1)
            
            // MARK: Settings Tab
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
                .tag(2)
        }
    }
}

#Preview {
    DashboardView()
}

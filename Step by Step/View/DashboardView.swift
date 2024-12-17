//
//  DashboardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

struct DashboardView: View {
    // Track current energy points across the app
    @State private var currentEnergyPoints: Int = 0
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
                viewModel: StoryTitleCardViewModel(),
                currentEnergyPoints: $currentEnergyPoints
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

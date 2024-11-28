//
//  DashboardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedTab: Int = 1

    var body: some View {
        // MARK: TabView for bottom navigation
        TabView(selection: $selectedTab) {
            
            // MARK: Achievements Tab
            AchievementsView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Achievements")
                }
                .tag(0)

            // MARK: Home Tab
            HomeView(viewModel: StoriesTitleCardViewModel())
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

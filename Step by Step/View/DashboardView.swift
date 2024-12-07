//
//  DashboardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

struct DashboardView: View {
    // Default to view tab 1 (Home)
    @State private var selectedTab: Int = 1
    // State to control navigation
    @State private var navigationToStoryHome: Bool = false
    // State to control current story selected
    @State private var selectedStory: StoryTitleCard? = nil
    
    var body: some View {
        NavigationStack {
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
                HomeView(
                    viewModel: StoriesTitleCardViewModel(),
                    navigateToStoryHome: $navigationToStoryHome,
                    onStorySelected: { story in
                        selectedStory = story
                    }
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
                .navigationDestination(isPresented: $navigationToStoryHome) {
                    if let story = selectedStory {
                        StoryHomeView(
                            story: story
                        )
                    } else {
                        DashboardView()
                }
            }
        }
    }
}

#Preview {
    DashboardView()
}

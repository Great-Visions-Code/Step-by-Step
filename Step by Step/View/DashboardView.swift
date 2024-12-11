//
//  DashboardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

struct DashboardView: View {
    // Track navigation path
    @State private var path = NavigationPath()
    // Track selected story
    @State private var selectedStory: StoryTitleCard? = nil
    // Track current energy points across the app
    @State private var currentEnergyPoints: Int = 0
    // Track the selected tab, defaulting to Home
    @State private var selectedTab: Int = 1
    
    var body: some View {
        NavigationStack(path: $path) {
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
                    viewModel: StoryTitleCardViewModel(),
                    currentEnergyPoints: $currentEnergyPoints,
                    onStorySelected: { story in
                        selectedStory = story
                        path.append("StoryDetailSheetView")
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
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "StoryDetailSheetView":
                    if let story = selectedStory {
                        StoryDetailSheetView(
                            story: story,
                            onEnterStory: {
                                path.append("StoryHomeView")
                            }
                        )
                    }
                case "StoryHomeView":
                    if let story = selectedStory {
                        StoryHomeView(
                            story: story,
                            currentEnergyPoints: currentEnergyPoints,
                            onNavigate: { path.append($0)
                            }
                        )
                    }
                case "SurviveStoryView":
                    SurviveStoryView()
                case "StoryAchievementsView":
                    StoryAchievementsView()
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    DashboardView()
}

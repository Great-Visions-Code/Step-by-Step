//
//  HomeView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

struct HomeView: View {
    // ViewModels for managing stories and player stats
    @StateObject var storyViewModel: StoryTitleCardViewModel
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    // Navigation path to track user navigation
    @State private var path = NavigationPath()
    // Track selected story
    @State private var selectedStory: StoryTitleCard? = nil
    
    // Placeholder values
    @State private var totalStepsGoal: Int = 10000
    @State private var currentStepsTaken: Int = 7000

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                // MARK: CurrentStepsTakenProgress.swift GV 11/25/24
                CurrentStepsTakenProgressView(
                    currentStepsTaken: currentStepsTaken,
                    totalStepsGoal: totalStepsGoal
                )
                
                // MARK: ConvertToEnergyButtonView.swift GV 11/25/24
                ConvertToEnergyButtonView(
                    playerStatsViewModel: playerStatsViewModel,
                    currentStepsTaken: $currentStepsTaken,
                    totalStepsGoal: $totalStepsGoal
                )
                
                // MARK: CurrentEnergyProgressView.swift GV 11/27/24
                CurrentEnergyProgressView(
                    playerStatsViewModel: playerStatsViewModel
                )
                
                // MARK: ChooseYourAdventureView.swift GV 11/27/24
                ChooseYourAdventureView(
                    stories: storyViewModel.stories,
                    onStorySelected: { story in
                        selectedStory = story
                        path.append("StoryDetailsView")
                    }
                )
            }
            .padding()
            // MARK: Navigation Destinations
            .navigationDestination(for: String.self) { destination in
                switch destination {
                    
                // Navigate to StoryDetailsView()
                case "StoryDetailsView":
                    if let story = selectedStory {
                        StoryDetailsView(
                            story: story,
                            onEnterStoryButton: {
                                // When "Enter Story" is pressed, navigate to StoryHomeView()
                                path.append("StoryHomeView")
                            }
                        )
                    }
                    
                // Navigate to StoryHomeView()
                case "StoryHomeView":
                    if let story = selectedStory {
                        StoryHomeView(
                            story: story,
                            playerStatsViewModel: playerStatsViewModel,
                            onNavigateButton: {
                                // Append navigation destination dynamically
                                path.append($0)
                            }
                        )
                    }
                    
                // Navigate to StoryView()
                case "StoryView":
                    StoryView(
                            onNavigateStoryHomeIcon: {
                                // When Home icon is pressed in StoryView(), navigate back to StoryHomeView by removing last navigation destination
                                path.removeLast()
                            },
                            onNavigateStoryAchievementsIcon: {
                                // When Achievements icon is pressed, navigate to StoryAchievementsView()
                                path.append("StoryAchievementsView")
                            },
                            onNavigateStoryMapIcon: {
                                // When Map icon is pressed, navigate to StoryMapView()
                                path.append(("StoryMapView"))
                            },
                            playerStatsViewModel: playerStatsViewModel
                        )
                        // Hide TabView here for a more immersive experience in StoryView()
                        .toolbar(.hidden, for: .tabBar)
                    
                // Navigate to StoryAchievementsView()
                case "StoryAchievementsView":
                    StoryAchievementsView()
                        // Hide TabView here for cleaner look
                        .toolbar(.hidden, for: .tabBar)
                    
                // Navigate to StoryMapView()
                case "StoryMapView":
                    StoryMapView()
                    // Hide TabView here to maintain immersive feel in StoryView()
                    .toolbar(.hidden, for: .tabBar)
                    
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    HomeView(
        storyViewModel: StoryTitleCardViewModel(),
        playerStatsViewModel: PlayerStatsViewModel()
    )
}

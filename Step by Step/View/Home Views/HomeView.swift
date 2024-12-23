//
//  HomeView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// The main view of the app's dashboard, providing an overview of the player's energy,
/// step tracking progress, and available stories.
struct HomeView: View {
    // ViewModel for managing available story cards.
    @StateObject var storyViewModel: StoryTitleCardViewModel
    
    // ViewModel for managing player stats such as health and energy.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    // ViewModel for managing step tracking data.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    // ViewModel for managing achievements data.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    // ViewModel for managing story content data.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    // Tracks the navigation path for transitioning between views.
    @State private var path = NavigationPath()
    // Holds the story selected by the user, enabling navigation to its details.
    @State private var selectedStory: StoryTitleCard? = nil

    var body: some View {
        // NavigationStack manages the navigation flow and associated destinations.
        NavigationStack(path: $path) {
            VStack {
                // Displays the user's progress toward their daily step goal.
                CurrentStepsTakenProgressView(
                    stepTrackerViewModel: stepTrackerViewModel
                )
                // Button to convert steps into energy points for use in the game.
                ConvertToEnergyButtonView(
                    playerStatsViewModel: playerStatsViewModel,
                    stepTrackerViewModel: stepTrackerViewModel
                )
                // Displays the player's current energy level.
                CurrentEnergyProgressView(
                    playerStatsViewModel: playerStatsViewModel
                )
                // A horizontal scrollable list of available adventures for the player to choose from.
                ChooseYourAdventureView(
                    stories: storyViewModel.stories,
                    onStorySelected: { story in
                        selectedStory = story
                        path.append("StoryDetailsView") // Navigate to the story details.
                    }
                )
            }
            .padding()
            
            // MARK: Navigation Destinations.
            // Handles navigation to various destinations based on the path value.
            .navigationDestination(for: String.self) { destination in
                switch destination {
                    
                case "StoryDetailsView":
                    // Show details about the selected story.
                    if let story = selectedStory {
                        StoryDetailsView(
                            story: story,
                            onEnterStoryButton: {
                                path.append("StoryHomeView") // Navigate to the story's main view.
                            }
                        )
                    }
                    
                case "StoryHomeView":
                    // Show the main view for the selected story.
                    if let story = selectedStory {
                        StoryHomeView(
                            story: story,
                            playerStatsViewModel: playerStatsViewModel,
                            achievementsViewModel: achievementsViewModel,
                            storyContentViewModel: storyContentViewModel,
                            onNavigateButton: { nextView in
                                path.append(nextView) // Navigate to the specified next view.
                            }
                        )
                    }
                    
                case "StoryView", "ResumeStoryView": // Temporarily tying ResumeStoryView to StoryView.
                    // Show the interactive view of the story.
                    StoryView(
                        onNavigateStoryHomeIcon: {
                            path.removeLast() // Return to last view.
                        },
                        onNavigateStoryAchievementsIcon: {
                            path.append("StoryAchievementsView") // Navigate to story achievements.
                        },
                        onNavigateStoryMapIcon: {
                            path.append("StoryMapView") // Navigate to the story map.
                        },
                        playerStatsViewModel: playerStatsViewModel,
                        storyContentViewModel: storyContentViewModel
                    )
                    .toolbar(.hidden, for: .tabBar) // Hide the TabView for a focused experience.
                    
                case "StoryAchievementsView":
                    // Show achievements related to the current story.
                    StoryAchievementsView()
                        .toolbar(.hidden, for: .tabBar) // Hide the TabView for a focused experience.
                    
                case "StoryMapView":
                    // Show the map view for the current story.
                    StoryMapView()
                        .toolbar(.hidden, for: .tabBar) // Hide the TabView for a focused experience.
                    
                default:
                    EmptyView() // Handle unexpected or invalid destinations.
                }
            }
        }
    }
}

#Preview {
    HomeView(
        storyViewModel: StoryTitleCardViewModel(),
        playerStatsViewModel: PlayerStatsViewModel(),
        stepTrackerViewModel: StepTrackerViewModel(),
        achievementsViewModel: AchievementsViewModel(),
        storyContentViewModel: StoryContentViewModel()
    )
}

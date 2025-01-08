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
    @StateObject var storyViewModel: StoryCardViewModel
    
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
    @State private var selectedStory: StoryCard? = nil

    var body: some View {
        // NavigationStack manages the navigation flow and associated destinations.
        NavigationStack(path: $path) {
            Spacer()
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
                    stories: $storyViewModel.stories, // Pass stories as a binding.
                    storyContentViewModel: storyContentViewModel, // Pass StoryContentViewModel for dynamic updates.
                    onStorySelected: { story in
                        selectedStory = story
                        path.append("StoryDetailsView") // Navigate to the story details.
                    }
                )
            }
            .padding()
            Spacer()
            Divider()
            
            // MARK: - Navigation Destinations
            
            // Handles navigation to various destinations based on the path value.
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "StoryDetailsView":
                    // Show details about the selected story.
                    if let story = selectedStory {
                        StoryDetailsView(
                            story: story,
                            storyContentViewModel: storyContentViewModel, // Pass the StoryContentViewModel.
                            onEnterStoryButton: {
                                path.append("StoryHomeView") // Navigate to the story's main view.
                            }
                        )
                    }
                    
                case "StoryHomeView":
                    // Show the main view for the selected story.
                    if let story = selectedStory {
                        StoryHomeView(
                            story: story, // Pass the selected story object to the view.
                            playerStatsViewModel: playerStatsViewModel, // Provide the player's stats (health, energy).
                            achievementsViewModel: achievementsViewModel, // Provide the user's achievements data.
                            storyContentViewModel: storyContentViewModel, // Provide the story content and progress data.
                            onNavigateButton: { nextView in
                                // Handle navigation to the specified next view when a button is pressed.
                                path.append(nextView) // Append the target view to the navigation path.
                            }
                        )
                    }
                    
                case "StoryView", "ResumeStoryView":
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
        storyViewModel: StoryCardViewModel(),
        playerStatsViewModel: PlayerStatsViewModel(),
        stepTrackerViewModel: StepTrackerViewModel(),
        achievementsViewModel: AchievementsViewModel(),
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        )
    )
}

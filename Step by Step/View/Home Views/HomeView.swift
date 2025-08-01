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
    // HealthKit ViewModel for retrieving real step count.
    @StateObject private var healthKitViewModel = HealthKitViewModel()
    // SelectedStoryViewModel to hold story selected by user.
    @StateObject private var selectedStoryViewModel = SelectedStoryViewModel()
    
    // ViewModel for managing available story cards.
    @ObservedObject var storyCardViewModel: StoryCardViewModel
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

    var body: some View {
        // NavigationStack manages the navigation flow and associated destinations.
        NavigationStack(path: $path) {
            ZStack {
                WaveBackground()
                
                VStack(spacing: 28) {
                    
                    // MARK: - Circular Step Tracker
                    // Displays the user's progress toward their daily step goal.
                    ConvertedStepsProgressRingView(
                        stepTrackerViewModel: stepTrackerViewModel
                    )
                    .onAppear {
                        // Requests HealthKit authorization when the view appears.
                        healthKitViewModel.requestHealthKitAuthorization()
                    }
                    .onChange(of: healthKitViewModel.hkCurrentStepsCount) { _, newSteps in
                        // Updates the step count in StepTrackerViewModel whenever
                        // HealthKit provides new step data.
                        stepTrackerViewModel.updateCurrentSteps(to: newSteps)
                    }
                    .padding()
                    
                    // MARK: - Energy Card
                    EnergyCardView(playerStatsViewModel: playerStatsViewModel,
                                   stepTrackerViewModel: stepTrackerViewModel
                    )
                                        
                    // MARK: - Story Scroll View
                    // A horizontal scrollable list of available adventures for the player to choose from.
                    StoryCarouselView(
                        stories: $storyCardViewModel.stories,
                        storyContentViewModel: storyContentViewModel,
                        onStorySelected: { story in
                            DispatchQueue.main.async {
                                print("Before update: selectedStory = \(selectedStoryViewModel.selectedStory?.storyTitle ?? "nil")")
                                selectedStoryViewModel.selectedStory = story
                                print("After update: selectedStory = \(selectedStoryViewModel.selectedStory?.storyTitle ?? "nil")")
                                path.append("StoryDetailsView")
                            }
                        }
                    )
                }
            }
            
            // MARK: - Navigation Destinations
            
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "StoryDetailsView":
                    // Displays story details if a story has been selected.
                    if let story = selectedStoryViewModel.selectedStory {
                        StoryDetailsView(
                            story: story,
                            storyContentViewModel: storyContentViewModel,
                            onEnterStoryButton: {
                                path.append("StoryHomeView")
                            }
                        )
                        .id(path.count) // Forces refresh to avoid stale UI.
                    } else {
                        EmptyView()
                    }
                    
                case "StoryHomeView":
                    // Navigates to the main gameplay screen for the selected story.
                    if let story = selectedStoryViewModel.selectedStory {
                        StoryHomeView(
                            story: story,
                            playerStatsViewModel: playerStatsViewModel,
                            achievementsViewModel: achievementsViewModel,
                            storyContentViewModel: storyContentViewModel,
                            onNavigateButton: { nextView in
                                path.append(nextView)
                            }
                        )
                    } else {
                        EmptyView()
                    }

                case "StoryView", "ResumeStoryView":
                    StoryView(
                        onNavigateStoryHomeIcon: {
                            path.removeLast()
                        },
                        onNavigateStoryAchievementsIcon: {
                            path.append("StoryAchievementsView")
                        },
                        onNavigateStoryMapIcon: {
                            path.append("StoryMapView")
                        },
                        playerStatsViewModel: playerStatsViewModel,
                        storyContentViewModel: storyContentViewModel
                    )
                    .toolbar(.hidden, for: .tabBar)
                    
                case "StoryAchievementsView":
                    StoryAchievementsView(
                        achievementsViewModel: AchievementsViewModel()
                    )
                    .toolbar(.hidden, for: .tabBar)
                    
                case "StoryMapView":
                    StoryMapView()
                        .toolbar(.hidden, for: .tabBar)
                    
                default:
                    EmptyView() // Handle unexpected destinations
                }
            }
        }
    }
}

#Preview {
    HomeView(
        storyCardViewModel: StoryCardViewModel(),
        playerStatsViewModel: PlayerStatsViewModel(),
        stepTrackerViewModel: StepTrackerViewModel(),
        achievementsViewModel: AchievementsViewModel(),
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        )
    )
}

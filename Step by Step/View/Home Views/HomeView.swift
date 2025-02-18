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
                VStack {
                    Spacer()
                    // Displays the user's progress toward their daily step goal.
                    CurrentStepsTakenProgressView(
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
                        stories: $storyCardViewModel.stories,
                        storyContentViewModel: storyContentViewModel,
                        onStorySelected: { story in
                            DispatchQueue.main.async {
                                print("Before update: selectedStory = \(selectedStoryViewModel.selectedStory?.title ?? "nil")")
                                selectedStoryViewModel.selectedStory = story
                                print("After update: selectedStory = \(selectedStoryViewModel.selectedStory?.title ?? "nil")")
                                path.append("StoryDetailsView")
                            }
                        }
                    )
                    Spacer()
                    Divider()
                }
                .padding()
            }
            
            // MARK: - Navigation Destinations
            
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "StoryDetailsView":
                    if let story = selectedStoryViewModel.selectedStory {
                        DispatchQueue.main.async {
                            print("📌 Displaying StoryDetailsView for: \(story.title)")
                        }
                        return AnyView(
                            StoryDetailsView(
                                story: story,
                                storyContentViewModel: storyContentViewModel,
                                onEnterStoryButton: {
                                    path.append("StoryHomeView")
                                }
                            )
                            .id(path.count) // Forces a refresh when navigating
                        )
                    } else {
                        DispatchQueue.main.async {
                            print("⚠️ selectedStory is nil, displaying EmptyView")
                        }
                        return AnyView(EmptyView())
                    }
                    
                case "StoryHomeView":
                    if let story = selectedStoryViewModel.selectedStory {
                        return AnyView(
                            StoryHomeView(
                                story: story,
                                playerStatsViewModel: playerStatsViewModel,
                                achievementsViewModel: achievementsViewModel,
                                storyContentViewModel: storyContentViewModel,
                                onNavigateButton: { nextView in
                                    path.append(nextView)
                                }
                            )
                        )
                    } else {
                        return AnyView(EmptyView())
                    }

                case "StoryView", "ResumeStoryView":
                    return AnyView(
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
                    )
                    
                case "StoryAchievementsView":
                    return AnyView(
                        StoryAchievementsView()
                            .toolbar(.hidden, for: .tabBar)
                    )
                    
                case "StoryMapView":
                    return AnyView(
                        StoryMapView()
                            .toolbar(.hidden, for: .tabBar)
                    )
                    
                default:
                    return AnyView(EmptyView()) // Handle unexpected destinations
                }
            }
        }
    }
}

/// ViewModel: Persist `selectedStory` across renders
class SelectedStoryViewModel: ObservableObject {
    @Published var selectedStory: StoryCard?
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

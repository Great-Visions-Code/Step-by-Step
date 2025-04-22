//
//  StoryHomeView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/1/24.
//

import SwiftUI

/// Displays the main hub for a selected story, including the player's progress, current health and energy,
/// and options for resuming, restarting, or viewing achievements.
/// Provides navigational buttons to various sections of the app.
struct StoryHomeView: View {
    // The story object containing title, color, completion, and details to be displayed.
    var story: StoryCard
    
    // ViewModel to manage and observe the player's stats, such as health and energy.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    // ViewModel to manage achievements.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    // ViewModel to manage the story content.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    // Closure to handle navigation to other sections, such as resuming or starting a new story.
    var onNavigateButton: (String) -> Void
    
    /// Configuration for navigation buttons with their titles and corresponding actions.
    let buttonActions: [(title: String, action: String)] = [
        ("Resume Story", "ResumeStoryView"),
        ("Start New Story", "StoryView"),
        ("Story Achievements", "StoryAchievementsView"),
    ]
    
    var body: some View {
        VStack {
            Spacer() // Spacer to push content towards the center of the screen.
            
            // Display the title of the current story.
            StoryTitleView(
                title: story.storyTitle
            )
            .padding()

            // Show the player's current health and energy levels.
            VStack(spacing: 20) {
                StoryHPAndEPBarView(
                    currentPoints: playerStatsViewModel.playerStats.health,
                    maxPoints: 10,
                    type: .health,
                    iconSpacing: 8
                )
                StoryHPAndEPBarView(
                    currentPoints: playerStatsViewModel.playerStats.energy,
                    maxPoints: 10,
                    type: .energy,
                    iconSpacing: 14
                )
            }
            .padding()
            
            // Display the current day and chapter of the story, along with the number of attempts.
            VStack {
                StoryDayAndChapterView(
                    storyContentViewModel: storyContentViewModel
                )
                .padding(.bottom, 20)
                
                // Display Survive completion percentage dynamically.
                CompletionPercentageView(storyContentViewModel: StoryContentViewModel(
                    achievementsViewModel: AchievementsViewModel(),
                    playerStatsViewModel: PlayerStatsViewModel()
                    )
                )
                
                // Display Attempts taken.
                AttemptTrackerView(
                    achievementsViewModel: achievementsViewModel
                )
               // .padding()
            }
            .padding()

            // Provide navigation buttons to resume, start a new story, or view achievements.
            VStack(spacing: 20) {
                // Loop through each button configuration in `buttonActions`.
                ForEach(buttonActions, id: \.title) { button in
                    // Create a navigation button for each action.
                    StoryHomeNavigationButtonView(
                        buttonText: button.title, // The text displayed on the button.
                        buttonAction: {
                            // Determine the action to take based on the button's `action` property.
                            if button.action == "ResumeStoryView" {
                                // If the button is for resuming the story, call the resumeStory method.
                                storyContentViewModel.resumeStory()
                            } else if button.action == "StoryView" {
                                // If the button is for starting a new story, reset the story to its initial state.
                                storyContentViewModel.resetStory() // Start story from beginning.
                                playerStatsViewModel.resetHealth() // Reset health to full.
                            }
                            // Trigger navigation to the appropriate view using the button's action property.
                            onNavigateButton(button.action)
                        }
                    )
                }
            }
            
            Spacer() // Spacer to balance layout and push buttons toward the bottom.
            Divider()
        }
        .padding()
        // Hide the default navigation back button since this is a top-level view.
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryHomeView(
        story: StoryCard(
            storyTitle: "Survive",
            storyCardImage: "SurviveStoryCardImage",
            storyCompletion: 0,
            storyDetails: "DETAILS NOT SHOWN"
        ),
        playerStatsViewModel: PlayerStatsViewModel(),
        achievementsViewModel: AchievementsViewModel(),
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        ),
        onNavigateButton: { _ in }
    )
}

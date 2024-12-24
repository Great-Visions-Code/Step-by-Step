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
    var story: StoryTitleCard
    
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
                title: story.title
            )
            .padding(.bottom, 25)

            // Show the player's current health and energy levels.
            VStack(spacing: 20) {
                StoryHPAndEPBarView(
                    currentPoints: playerStatsViewModel.playerStats.health,
                    maxPoints: 10,
                    barColor: .red,
                    labelText: "Health"
                )
                StoryHPAndEPBarView(
                    currentPoints: playerStatsViewModel.playerStats.energy,
                    maxPoints: 10,
                    barColor: .blue,
                    labelText: "Energy"
                )
            }
            .padding()
            
            // Display the current day and chapter of the story, along with the number of attempts.
            VStack {
                StoryDayAndChapterView(
                    storyContentViewModel: storyContentViewModel
                )
                .padding(.bottom, 20)
                
                // Display Attempts taken.
                AttemptTrackerView(
                    achievementsViewModel: achievementsViewModel
                )
                .padding(.vertical, 20)
            }
            .padding()

            // Provide navigation buttons to resume, start a new story, or view achievements.
            VStack(spacing: 20) {
                ForEach(buttonActions, id: \.title) { button in
                    StoryHomeNavigationButtonView(
                        buttonText: button.title,
                        buttonAction: {
                            if button.action == "ResumeStoryView" {
                                storyContentViewModel.resumeStory()
                            } else if button.action == "StoryView" {
                                storyContentViewModel.resetStory() // Reset the story to Day 1 Chapter 1.
                            }
                            onNavigateButton(button.action) // Trigger navigation based on button action.
                        }
                    )
                }
            }
            
            Spacer() // Spacer to balance layout and push buttons toward the bottom.
        }
        .padding()
        // Hide the default navigation back button since this is a top-level view.
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryHomeView(
        story: StoryTitleCard(
            title: "Story Title",
            color: .green,
            completion: 100,
            details: "DETAILS NOT SHOWN"
        ),
        playerStatsViewModel: PlayerStatsViewModel(),
        achievementsViewModel: AchievementsViewModel(),
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel()
        ),
        onNavigateButton: { _ in }
    )
}

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
    // The story object containing title, completion, and details to be displayed.
    var story: StoryCard
    
    // ViewModels to manage and observe the player's stats, achievements, and story content.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    @ObservedObject var achievementsViewModel: AchievementsViewModel
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
        ZStack {
            // MARK: - Background Image
            Image("survive-day1-homeImage")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // MARK: - Displays Story Title
                StoryTitleTextView(
                    title: story.storyTitle,
                    font: .largeTitle,
                    fontWeight: .black,
                    fontWidth: .expanded,
                    fontDesign: .serif,
                    fontSize: 80,
                    kerning: 3.5,
                    foregroundColor: .white.opacity(0.9)
                )
                .padding()
                
                // MARK: - Displays Players Visual Stats
                VStack(spacing: 20) {
                    PlayersVisualStatsView(
                        font: .largeTitle,
                        fontWeight: .black,
                        fontWidth: .expanded,
                        fontDesign: .serif,
                        fontSize: 15,
                        kerning: 2.5,
                        foregroundColor: .white.opacity(0.9),
                        currentPoints: playerStatsViewModel.playerStats.health,
                        maxPoints: 10,
                        iconType: .health,
                        iconSpacing: 8,
                        capsuleColor: Color.white.opacity(0.15),
                        iconColor: Color.red.opacity(0.9),
                        iconOutlineColor: Color.white.opacity(0.9)
                    )
                    PlayersVisualStatsView(
                        font: .largeTitle,
                        fontWeight: .black,
                        fontWidth: .expanded,
                        fontDesign: .serif,
                        fontSize: 15,
                        kerning: 2.5,
                        foregroundColor: .white.opacity(0.9),
                        currentPoints: playerStatsViewModel.playerStats.energy,
                        maxPoints: 10,
                        iconType: .energy,
                        iconSpacing: 14,
                        capsuleColor: Color.white.opacity(0.15),
                        iconColor: Color.blue.opacity(0.9),
                        iconOutlineColor: Color.white.opacity(0.9)
                    )
                }
                .padding()
                
                // MARK: - Displays Day and Chapter
                VStack {
                    StoryDayAndChapterTextView(
                        storyContentViewModel: storyContentViewModel,
                        font: .largeTitle,
                        fontWeight: .black,
                        fontWidth: .expanded,
                        fontDesign: .serif,
                        fontSize: 25,
                        subheadlineSize: 18,
                        kerning: 2.5,
                        foregroundColor: .white.opacity(0.9)
                    )
                    .padding(.bottom, 20)
                    
                    // MARK: - Display Survive completion percentage dynamically.
                    StoryProgressDisplayView(
                        storyContentViewModel: StoryContentViewModel(
                        achievementsViewModel: AchievementsViewModel(),
                        playerStatsViewModel: PlayerStatsViewModel()
                        ),
                        font: .largeTitle,
                        fontWeight: .black,
                        fontWidth: .expanded,
                        fontDesign: .serif,
                        fontSize: 15,
                        kerning: 2.5,
                        foregroundColor: .white.opacity(0.9)
                    )
                    .padding(.bottom, 20)
                    
                    // MARK: - Display Attempts taken.
                    AttemptsCountView(
                        achievementsViewModel: achievementsViewModel,
                    )
                    .padding()
                }
                .padding()
                
                // MARK: - Provide navigation buttons to resume, start a new story, or view achievements.
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
                            },
                            font: .largeTitle,
                            fontWeight: .black,
                            fontWidth: .expanded,
                            fontDesign: .serif,
                            fontSize: 18,
                            kerning: 1.0,
                            foregroundColor: .white.opacity(0.9)
                        )
                    }
                }
                Spacer() // Spacer to balance layout and push buttons toward the bottom.
            }
        }
        // Hide the default navigation back button since this is a top-level view.
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Preview

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

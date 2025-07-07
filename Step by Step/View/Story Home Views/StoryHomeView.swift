//
//  StoryHomeView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/1/24.
//

import SwiftUI

/// The main hub screen for a selected story.
///
/// `StoryHomeView` displays the current status of the player's journey within the story,
/// including their health, energy, story day and chapter, completion progress, and total attempts.
/// This view also allows the user to resume their progress, start a new run, or view story-specific achievements.
struct StoryHomeView: View {
    
    // MARK: - Dependencies
    
    /// The selected story metadata (title, completion %, image, and details).
    let story: StoryCard
    
    /// View model tracking player's current health and energy stats.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    /// View model tracking player achievements such as attempts and milestone unlocks.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    
    /// View model for loading and progressing through story content.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    /// A closure that handles navigation based on button action identifiers.
    /// For example: `"ResumeStoryView"` or `"StoryAchievementsView"`
    let onNavigateButton: (String) -> Void
    
    // MARK: - Navigation Button Configuration
    
    /// A list of navigation button labels and corresponding navigation actions.
    let buttonActions: [(title: String, action: String)] = [
        ("Resume Story", "ResumeStoryView"),
        ("Start New Story", "StoryView"),
        ("Story Achievements", "StoryAchievementsView"),
    ]
    
    // MARK: - View Body
    
    var body: some View {
        ZStack {
            // MARK: - Background Styling
            
            // Background image related to story theme
            Image("survive-day1-homeImage")
                .resizable()
                .ignoresSafeArea()
            
            // Overlay to increase text contrast
            Color.black
                .opacity(0.75)
                .ignoresSafeArea()
            
            VStack {
                // MARK: - Story Title
                
                StoryTitleTextView(
                    title: story.storyTitle,
                    font: .largeTitle,
                    fontWeight: .black,
                    fontWidth: .expanded,
                    fontDesign: .serif,
                    fontSize: 80,
                    kerning: 6.0,
                    foregroundColor: .white.opacity(0.95)
                )
                .padding()
                
                // MARK: - Player Stats (Health & Energy)
                
                VStack(spacing: 20) {
                    StoryStatsBarView(
                        font: .largeTitle,
                        fontWeight: .black,
                        fontWidth: .expanded,
                        fontDesign: .serif,
                        fontSize: 18,
                        kerning: 3.0,
                        foregroundColor: .white.opacity(0.95),
                        currentPoints: playerStatsViewModel.playerStats.health,
                        maxPoints: 10,
                        iconType: .health,
                        iconSpacing: 8,
                        capsuleColor: Color.white.opacity(0.3),
                        iconColor: Color.red.opacity(0.95),
                        iconOutlineColor: Color.white.opacity(0.95)
                    )
                    
                    StoryStatsBarView(
                        font: .largeTitle,
                        fontWeight: .black,
                        fontWidth: .expanded,
                        fontDesign: .serif,
                        fontSize: 18,
                        kerning: 3.0,
                        foregroundColor: .white.opacity(0.95),
                        currentPoints: playerStatsViewModel.playerStats.energy,
                        maxPoints: 10,
                        iconType: .energy,
                        iconSpacing: 14,
                        capsuleColor: Color.white.opacity(0.3),
                        iconColor: Color.blue.opacity(0.95),
                        iconOutlineColor: Color.white.opacity(0.95)
                    )
                }
                .padding()
                
                // MARK: - Story Status Info
                
                VStack(spacing: 5) {
                    StoryDayAndChapterTextView(
                        storyContentViewModel: storyContentViewModel,
                        font: .largeTitle,
                        fontWeight: .black,
                        fontWidth: .expanded,
                        fontDesign: .serif,
                        fontSize: 30,
                        subheadlineSize: 18,
                        kerning: 1.0,
                        subheadlineKerning: 3.0,
                        foregroundColor: .white.opacity(0.95)
                    )
                    
//                    // Dynamic progress display as percentage bar
//                    StoryProgressDisplayView(
//                        storyContentViewModel: storyContentViewModel,
//                        font: .largeTitle,
//                        fontWeight: .black,
//                        fontWidth: .expanded,
//                        fontDesign: .serif,
//                        fontSize: 18,
//                        kerning: 3.0,
//                        foregroundColor: .white.opacity(0.95)
//                    )
                    
                    // Track number of story attempts (resets)
                    StoryAttemptsTrackerView(
                        achievementsViewModel: achievementsViewModel,
                        font: .largeTitle,
                        fontWeight: .black,
                        fontWidth: .expanded,
                        fontDesign: .serif,
                        fontSize: 18,
                        kerning: 1.0,
                        foregroundColor: .white.opacity(0.95)
                    )
                }
                .padding()
                .padding(.bottom, 20)
                
                // MARK: - Navigation Buttons
                
                VStack(spacing: 20) {
                    ForEach(buttonActions, id: \.title) { button in
                        StoryHomeNavigationButtonView(
                            buttonText: button.title,
                            buttonAction: {
                                // Handle special setup logic before navigation
                                switch button.action {
                                case "ResumeStoryView":
                                    storyContentViewModel.resumeStory()
                                    
                                case "StoryView":
                                    storyContentViewModel.resetStory()
                                    playerStatsViewModel.resetHealth()
                                    
                                default:
                                    break
                                }
                                onNavigateButton(button.action)
                            },
                            font: .largeTitle,
                            fontWeight: .black,
                            fontWidth: .expanded,
                            fontDesign: .serif,
                            fontSize: 25,
                            kerning: 1.0,
                            foregroundColor: .white.opacity(0.95),
                            backgroundColor: .white.opacity(0.30)
                        )
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hides the default back button
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

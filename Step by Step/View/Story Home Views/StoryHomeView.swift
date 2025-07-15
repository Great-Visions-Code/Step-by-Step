//
//  StoryHomeView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/1/24.
//

import SwiftUI

/// The primary hub view for a selected story in the app.
///
/// `StoryHomeView` provides a summary of the player's progress in the current story.
/// It visually displays health, energy, current day, chapter progress, total attempts, and offers navigation
/// to resume the story, restart it, or view achievements.
///
/// This view acts as the central starting point before entering active gameplay.
struct StoryHomeView: View {
    
    // MARK: - Dependencies
    
    /// The selected story metadata used to populate this view.
    let story: StoryCard
    
    /// View model providing player stats (health, energy) for this story.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    /// View model providing achievement data (attempt count, milestones) for this story.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    
    /// View model managing the story chapters, progress, and content flow.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    /// A closure called with the navigation destination identifier (e.g., `"ResumeStoryView"`).
    let onNavigateButton: (String) -> Void
    
    // MARK: - Navigation Button Configuration
    
    /// Titles and action identifiers for navigation buttons.
    let buttonActions: [(title: String, action: String)] = [
        ("Resume Story", "ResumeStoryView"),
        ("Start New Story", "StoryView"),
        ("Achievements", "StoryAchievementsView"),
    ]
    
    // MARK: - View Body
    
    var body: some View {
        ZStack {
            // MARK: - Background
            
            Image("survive-day1-homeImage")
                .resizable()
                .ignoresSafeArea()
            
            Color.black
                .opacity(0.7)
                .ignoresSafeArea()
            
            // MARK: - Main Content Stack
            
            VStack(spacing: 50) {
                
                // MARK: - Story Title
                
                StoryTitleTextView(
                    title: story.storyTitle,
                    font: .largeTitle,
                    fontWeight: .black,
                    fontWidth: .expanded,
                    fontDesign: .serif,
                    fontSize: 82,
                    kerning: 3.0,
                    foregroundColor: .white.opacity(0.95)
                )
                .padding(.horizontal)
                    
                // MARK: - Player Stats (Health & Energy)
                
                VStack(spacing: 20) {
                    StoryStatsBarView(
                        font: .largeTitle,
                        fontWeight: .bold,
                        fontWidth: .expanded,
                        fontDesign: .monospaced,
                        fontSize: 19,
                        kerning: 0.0,
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
                        fontWeight: .bold,
                        fontWidth: .expanded,
                        fontDesign: .monospaced,
                        fontSize: 19,
                        kerning: 0.0,
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
                
                // MARK: - Story Info
                
                VStack(spacing: 25) {
                    StoryChapterTextView(
                        storyContentViewModel: storyContentViewModel,
                        font: .largeTitle,
                        fontWeight: .black,
                        fontWidth: .expanded,
                        fontDesign: .serif,
                        fontSize: 32,
                        kerning: 0.0,
                        foregroundColor: .white.opacity(0.95)
                    )
                    
                    // Shows story attempts and current day progress.
                    StoryDayAndAttemptsTrackerView(
                        achievementsViewModel: achievementsViewModel,
                        storyContentViewModel: StoryContentViewModel(
                            achievementsViewModel: AchievementsViewModel(),
                            playerStatsViewModel: PlayerStatsViewModel()
                        ),
                        font: .largeTitle,
                        fontWeight: .bold,
                        fontWidth: .expanded,
                        fontDesign: .monospaced,
                        fontSize: 19,
                        kerning: 0.0,
                        foregroundColor: .white.opacity(0.95)
                    )
                }
                
                // MARK: - Navigation Buttons
                
                VStack(spacing: 20) {
                    ForEach(buttonActions, id: \.title) { button in
                        StoryHomeNavigationButtonView(
                            buttonText: button.title,
                            buttonAction: {
                                // Perform specific actions before navigation
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
                            }
                        )
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Preview

#Preview {
    StoryHomeView(
        story: StoryCard(
            storyTitle: "SURVIVE",
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

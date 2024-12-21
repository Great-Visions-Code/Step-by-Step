//
//  StoryView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/9/24.
//

import SwiftUI

/// The main story view where players interact with the current chapter and monitor their progress.
/// Includes navigation options, player stats, and the story's content.
struct StoryView: View {
    // Closure executed when the home icon is tapped
    var onNavigateStoryHomeIcon: () -> Void
    // Closure executed when the achievements icon is tapped
    var onNavigateStoryAchievementsIcon: () -> Void
    // Closure executed when the map icon is tapped
    var onNavigateStoryMapIcon: () -> Void
    
    // The player's stats, including health and energy, managed through the view model
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    // The story's content, including chapters and decisions, managed through the view model
    @ObservedObject var storyContentViewModel: StoryContentViewModel

    var body: some View {
        VStack {
            // Navigation bar at the top with options for home, achievements, and map
            StoryNavigationIconsView(
                onStoryHomeIconTap: {
                    onNavigateStoryHomeIcon()
                },
                onStoryAchievementsIconTap: {
                    onNavigateStoryAchievementsIcon()
                },
                onStoryMapIconTap: {
                    onNavigateStoryMapIcon()
                }
            )
            
            // Displays the player's current health and energy
            PlayerStatsView(
                playerStatsViewModel: playerStatsViewModel,
                storyContentViewModel: storyContentViewModel
            )
            
            // Separator for visual clarity
            Divider()
                .padding(.vertical, 10)
            
            // Displays the current chapter's title, content, and options
            StoryChapterContentView(
                storyContentViewModel: storyContentViewModel
            )
        }
        // Hides the default navigation back button for a more immersive experience
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryView(
        onNavigateStoryHomeIcon: {},
        onNavigateStoryAchievementsIcon: {},
        onNavigateStoryMapIcon: {},
        playerStatsViewModel: PlayerStatsViewModel(),
        storyContentViewModel: StoryContentViewModel()
    )
}

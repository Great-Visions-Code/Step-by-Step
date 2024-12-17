//
//  StoryView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/9/24.
//

import SwiftUI

struct StoryView: View {
    // Closures to navigate based on icon
    var onNavigateStoryHomeIcon: () -> Void
    var onNavigateStoryAchievementsIcon: () -> Void
    var onNavigateStoryMapIcon: () -> Void

    var body: some View {
        VStack {
            // MARK: StoryNavigationIconsView() GV 12/15/24
            StoryNavigationIconsView(
                onStoryHomeIconTap: {
                    // Navigate back to StoryHomeView()
                    onNavigateStoryHomeIcon()
                },
                onStoryAchievementsIconTap: {
                    // Navigate to StoryAchievementsView()
                    onNavigateStoryAchievementsIcon()
                },
                onStoryMapIconTap: {
                    // Navigate to StoryMapView()
                    onNavigateStoryMapIcon()
                }
            )
            
            // MARK: PlayerStatsView() GV 12/15/24
            PlayerStatsView()
            
            Divider()
                .padding(.vertical, 10)
            
            // MARK: StoryChapterContentView() GV 12/15/24
            StoryChapterContentView()
        }
        // Hide navigation bar back button for a more immersive experience
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryView(
        onNavigateStoryHomeIcon: {},
        onNavigateStoryAchievementsIcon: {},
        onNavigateStoryMapIcon: {}
    )
}

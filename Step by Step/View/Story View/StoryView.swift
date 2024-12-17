//
//  StoryView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/9/24.
//

import SwiftUI

struct StoryView: View {
    // Closure to navigate back to StoryHomeView
    var onNavigateHomeInStoryIcon: () -> Void
    // Closure to navigate to StoryAchievementsView
    var onNavigateAchievements: () -> Void

    var body: some View {
        VStack {
            // MARK: StoryNavigationIconsView() GV 12/15/24
            StoryNavigationIconsView(
                onHomeTap: {
                    onNavigateHomeInStoryIcon() // Navigate back to StoryHomeView
                },
                onAchievementsTap: {
                    onNavigateAchievements() // Navigate to StoryAchievementsView
                },
                onMapTap: {
                    print("Navigate to StoryMapView") // Placeholder for map navigation
                }
            )
            
            // MARK: PlayerStatsView() GV 12/15/24
            PlayerStatsView()
            
            Divider()
                .padding(.vertical, 10)
            
            // MARK: StoryChapterContentView() GV 12/15/24
            StoryChapterContentView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryView(
        onNavigateHomeInStoryIcon: {},
        onNavigateAchievements: {}
    )
}

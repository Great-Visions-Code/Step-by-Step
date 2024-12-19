//
//  StoryNavigationIconsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

/// A reusable view that provides navigation icons for the Story view.
/// Allows users to navigate to different sections, such as the home, achievements, or map views.
struct StoryNavigationIconsView: View {
    // Closure executed when the home icon is tapped
    var onStoryHomeIconTap: () -> Void
    // Closure executed when the achievements icon is tapped
    var onStoryAchievementsIconTap: () -> Void
    // Closure executed when the map icon is tapped
    var onStoryMapIconTap: () -> Void
    
    var body: some View {
        // Horizontal stack for navigation icons
        HStack {
            // Home navigation button
            Button(action: {
                onStoryHomeIconTap()
            }) {
                Image(systemName: "house.fill")
                    .font(.title2)
                    .padding() // Adds touchable area around the icon
            }
            
            Spacer() // Pushes the next group of buttons to the right
            
            // Horizontal group for achievements and map icons
            HStack(spacing: 20) {
                // Achievements navigation button
                Button(action: {
                    onStoryAchievementsIconTap()
                }) {
                    Image(systemName: "trophy.fill")
                        .font(.title2)
                }
                
                // Map navigation button
                Button(action: {
                    onStoryMapIconTap()
                }) {
                    Image(systemName: "map.fill")
                        .font(.title2)
                }
            }
            .padding() // Adds spacing around the button group
        }
    }
}

#Preview {
    StoryNavigationIconsView(
        onStoryHomeIconTap: {},
        onStoryAchievementsIconTap: {},
        onStoryMapIconTap: {}
    )
}

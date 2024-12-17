//
//  StoryNavigationIconsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

struct StoryNavigationIconsView: View {
    // Closure to handle the navigation action
    var onStoryHomeIconTap: () -> Void
    var onStoryAchievementsIconTap: () -> Void
    var onStoryMapIconTap: () -> Void
    
    var body: some View {
        // Navigation icons
        HStack {
            // House Icon
            Button(action: {
                // Navigate back to StoryHomeView()
                onStoryHomeIconTap()
            }) {
                Image(systemName: "house.fill")
                    .font(.title2)
                    .padding()
            }
            
            Spacer()
            HStack(spacing: 20) {
                
                // Trophy Icon
                Button(action: {
                    // Navigate to StoryAchievementsView()
                    onStoryAchievementsIconTap()
                }) {
                    Image(systemName: "trophy.fill")
                        .font(.title2)
                }
                
                // Map Icon
                Button(action: {
                    // Navigate to StoryMapView()
                    onStoryMapIconTap()
                }) {
                    Image(systemName: "map.fill")
                        .font(.title2)
                }
            }
            .padding()
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

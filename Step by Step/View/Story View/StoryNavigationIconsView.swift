//
//  StoryNavigationIconsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

struct StoryNavigationIconsView: View {
    // Closure to handle the navigation action
    var onHomeTap: () -> Void
    var onAchievementsTap: () -> Void
    var onMapTap: () -> Void
    
    var body: some View {
        HStack {
            // Navigation icons
            Button(action: {
                // Navigate back to StoryHomeView()
                onHomeTap()
            }) {
                Image(systemName: "house.fill")
                    .font(.title2)
                    .padding()
            }
            Spacer()
            HStack(spacing: 20) {
                Button(action: {
                    // Navigate to StoryAchievementsView()
                    onAchievementsTap()
                }) {
                    Image(systemName: "trophy.fill")
                        .font(.title2)
                }
                Button(action: {
                    // Navigate to StoryMapView()
                    onMapTap()
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
        onHomeTap: {},
        onAchievementsTap: {},
        onMapTap: {}
    )
}

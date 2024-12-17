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
                onHomeTap() // Navigate back to StoryHomeView()
            }) {
                Image(systemName: "house.fill")
                    .font(.title2)
                    .padding()
            }
            Spacer()
            HStack(spacing: 20) {
                Button(action: {
                    onAchievementsTap() // Navigate to StoryAchievementsView()
                }) {
                    Image(systemName: "trophy.fill")
                        .font(.title2)
                }
                Button(action: {
                    onMapTap() // Navigate to StoryMapView()
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

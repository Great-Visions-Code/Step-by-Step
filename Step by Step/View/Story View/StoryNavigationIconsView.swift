//
//  StoryNavigationIconsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

struct StoryNavigationIconsView: View {
    var body: some View {
        HStack {
            // Navigation icons
            Button(action: {
                // Navigate back to DashboardView()
            }) {
                Image(systemName: "house.fill")
                    .font(.title2)
                    .padding()
            }
            Spacer()
            HStack(spacing: 20) {
                Button(action: {
                    // Navigate to StoryAchievementsView()
                }) {
                    Image(systemName: "trophy.fill")
                        .font(.title2)
                }
                Button(action: {
                    // Navigate to StoryMapView()
                }) {
                    Image(systemName: "map.fill")
                        .font(.title2)
                }
            }
            .padding()
        }    }
}

#Preview {
    StoryNavigationIconsView()
}

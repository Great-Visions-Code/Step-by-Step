//
//  PlayerStatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

/// A view that displays the player's current stats, including health, energy, and the current story day.
/// Utilizes the `PlayerStatsViewModel` to fetch and observe stat updates in real-time.
struct PlayerStatsView: View {
    /// ViewModel to manage and observe player stats, such as health and energy.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    /// ViewModel to track story content and progress, including the current day.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    var body: some View {
        HStack {
            // Section to display the player's current health points (HP).
            HStack(spacing: 5) {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                Text("\(playerStatsViewModel.playerStats.health) / 10")
                    .font(.headline)
            }
            Spacer()
            // Section to display the player's current energy points (EP).
            HStack(spacing: 5) {
                Image(systemName: "bolt.fill")
                    .foregroundStyle(.blue)
                Text("\(playerStatsViewModel.playerStats.energy) / 10")
                    .font(.headline)
            }
            Spacer()
            // Displays the current story day progress dynamically based on the StoryContentViewModel.
            if let currentChapter = storyContentViewModel.currentChapter {
                Text("Day \(currentChapter.storyDay) out of 10")
                    .font(.headline)
            } else {
                Text("Day 1 out of 10") // Default placeholder if no chapter is loaded
                    .font(.headline)
            }
        }
        .padding([.leading, .trailing])
    }
}

#Preview {
    PlayerStatsView(
        playerStatsViewModel: PlayerStatsViewModel(),
        storyContentViewModel: StoryContentViewModel()
    )
}

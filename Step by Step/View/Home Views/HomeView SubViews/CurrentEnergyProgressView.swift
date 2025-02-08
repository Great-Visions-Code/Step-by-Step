//
//  CurrentEnergyProgressView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// Displays the user's current energy points in the game.
///
/// This view observes the `PlayerStatsViewModel` to dynamically update
/// whenever the player's energy points change.
struct CurrentEnergyProgressView: View {
    /// The ViewModel responsible for managing player stats such as health and energy.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    var body: some View {
        VStack {
            // Title displaying "Current Energy" for clarity.
            Text("Current Energy:   \(playerStatsViewModel.playerStats.energy)/10")
                .font(.headline)
                .bold()
                    
            // Energy bar using lightning bolt icons.
            HStack(spacing: 5) {
                ForEach(0..<10, id: \.self) { index in
                    Image(systemName: index < playerStatsViewModel.playerStats.energy ? "bolt.fill" : "bolt")
                        .foregroundColor(index < playerStatsViewModel.playerStats.energy ? .blue : .gray)
                        .font(.title)
                }
            }
            .padding(5)
        }
        .padding()
    }
}

#Preview {
    let playerStatsViewModel = PlayerStatsViewModel()
    
    return CurrentEnergyProgressView(
        playerStatsViewModel: playerStatsViewModel
    )
}

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
        // Displays the current energy level as text.
        // Future iterations could replace this with a progress bar.
        Text("Current Energy: \(playerStatsViewModel.playerStats.energy)")
            .font(.headline)
            .padding(.top)
    }
}

#Preview {
    let playerStatsViewModel = PlayerStatsViewModel()
    
    return CurrentEnergyProgressView(
        playerStatsViewModel: playerStatsViewModel
    )
}

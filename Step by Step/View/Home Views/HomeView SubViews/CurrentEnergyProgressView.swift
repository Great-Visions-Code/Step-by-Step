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
    
    /// State to track when the animation should begin.
    @State private var animateBolts = false
    
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
                        .scaleEffect(animateBolts && index < playerStatsViewModel.playerStats.energy ? 1.2 : 1.0) // Slight pop effect
                        .opacity(animateBolts && index < playerStatsViewModel.playerStats.energy ? 1.0 : 0.3) // Fade in
                        .animation(.easeInOut(duration: 0.3).delay(Double(index) * 0.1), value: animateBolts)
                }
            }
            .onChange(of: playerStatsViewModel.playerStats.energy) {
                      animateBolts = false
                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                          withAnimation {
                              animateBolts = true
                          }
                      }
                  }
            .padding(5)
        }
        .padding(.top)
    }
}

#Preview {
    let playerStatsViewModel = PlayerStatsViewModel()
    
    return CurrentEnergyProgressView(
        playerStatsViewModel: playerStatsViewModel
    )
}

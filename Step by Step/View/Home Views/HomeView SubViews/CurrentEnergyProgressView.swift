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
            Text("Energy Reserves \(playerStatsViewModel.playerStats.energy)/10")
                .font(.headline)
                .bold()
            ZStack(alignment: .center) {
                // Background for alignment
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 352, height: 48)
                
                // Energy bar using lightning bolt icons.
                HStack(spacing: 5) {
                    ForEach(0..<10, id: \.self) { index in
                        // Determines if the bolt should be filled or outlined based on available energy.
                        Image(systemName: index < playerStatsViewModel.playerStats.energy ? "bolt.fill" : "bolt")
                        // Filled bolts are blue, empty bolts are gray.
                            .foregroundStyle(index < playerStatsViewModel.playerStats.energy ? .blue : .gray)
                        // Sets the icon size.
                            .font(.title)
                        // Creates a "pop" effect when a bolt is filled.
                            .scaleEffect(animateBolts && index < playerStatsViewModel.playerStats.energy ? 1.2 : 1.0)
                        // Smoothly fades in newly added bolts.
                            .opacity(animateBolts && index < playerStatsViewModel.playerStats.energy ? 1.0 : 0.3)
                        // Staggers the animation for a sequential fill effect.
                            .animation(.easeInOut(duration: 0.3).delay(Double(index) * 0.1), value: animateBolts)
                    }
                }
                .padding(5)
            }
            // Restart animation when the view appears.
            .onAppear {
                animateBolts = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        animateBolts = true
                    }
                }
            }
            // Detects when energy changes.
            .onChange(of: playerStatsViewModel.playerStats.energy) {
                animateBolts = false // Resets animation state.
                // Adds a slight delay to restart the animation.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        animateBolts = true // Triggers the animation effect for bolts.
                    }
                }
            }
        }
        .padding(.top)
    }
}

#Preview {
    let playerStatsViewModel = PlayerStatsViewModel()
    
    playerStatsViewModel.updateEnergy(to: 5)
    
    return CurrentEnergyProgressView(
        playerStatsViewModel: playerStatsViewModel
    )
}

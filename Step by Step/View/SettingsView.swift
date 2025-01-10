//
//  SettingsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// View responsible for displaying and managing user settings within the app.
struct SettingsView: View {
    // ViewModel to manage the player's stats.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            // Title for the settings page.
            Text("Settings")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            Spacer()
            
            // Update Energy to 10 for testing purposes
            Button(action: {
                playerStatsViewModel.updateEnergy(to: 10) // Call the updateEnergy function from the ViewModel.
            }) {
                Text("Update to 10 Energy Points")
                    .font(.title2)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.horizontal)
            
            Spacer() // Pushes the content to the top, leaving space at the bottom.
        }
        .padding()
    }
}

#Preview {
    SettingsView(playerStatsViewModel: PlayerStatsViewModel())
}

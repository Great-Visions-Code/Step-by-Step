//
//  DeveloperOptionsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/2/25.
//

import SwiftUI

/// A dedicated developer testing screen for debugging and modifying in-game stats.
///
/// This screen is not intended for end-users and should be **disabled** in production builds
/// to comply with Apple's App Store Guidelines (Guideline 2.3.1 - Non-public API).
struct DeveloperOptionsView: View {
    /// ViewModel responsible for managing player stats.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    /// Environment key to allow dismissing the modal.
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            // **Header Title**
            Text("Developer Options")
                .font(.title)
                .bold()
            
            // **Energy Reset Button**
            Button(action: {
                playerStatsViewModel.updateEnergy(to: 10)
            }) {
                Text("Set Energy to 10")
                    .font(.title2)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            Spacer()
            
            // **Dismiss Button**
            Button(action: { dismiss() }) {
                Text("Done")
                    .font(.title2)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    DeveloperOptionsView(playerStatsViewModel: PlayerStatsViewModel())
}

//
//  DeveloperOptionsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/2/25.
//

import SwiftUI

/// A dedicated developer testing screen for debugging and modifying in-game stats.
struct DeveloperOptionsView: View {
    /// ViewModel responsible for managing player stats.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    /// ViewModel responsible for tracking user achievements.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    /// Environment key to allow dismissing the modal.
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 70) {
            // Title
            Text("Developer Options")
                .font(.title)
                .bold()
            
            Spacer()

            // MARK: - Set Energy to 10 Button
            Button(action: {
                playerStatsViewModel.updateEnergy(to: 10)
            }) {
                Text("Set Energy to 10")
                    .font(.title2)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }

            // MARK: - Reset Attempt Count Button
            VStack(spacing: 10) {
                Text("Attempt #\(achievementsViewModel.achievements.attempts)")
                    .font(.title2)
                    .fontWeight(.medium)
                
                Button(action: {
                    achievementsViewModel.resetAttempts()
                }) {
                    Text("Reset Attempts")
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .padding(.top, 10)

            Spacer()

            // MARK: - Dismiss Button
            Button(action: { dismiss() }) {
                Text("Done")
                    .font(.title2)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .foregroundStyle(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    DeveloperOptionsView(
        playerStatsViewModel: PlayerStatsViewModel(),
        achievementsViewModel: AchievementsViewModel()
    )
}

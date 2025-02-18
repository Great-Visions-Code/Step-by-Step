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
    // ViewModel to manage step tracking settings.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            // Title for the settings page.
            Text("Settings")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            Spacer()
            
            // MARK: - Step Goal Adjuster
            VStack(spacing: 10) {
                Text("Daily Step Goal")
                    .font(.title2)
                    .bold()
                
                // Display current totalStepsGoal (directly from stepTrackerViewModel)
                Text("\(stepTrackerViewModel.stepTracker.totalStepsGoal) Steps")
                    .font(.title)
                    .bold()
                
                HStack(spacing: 30) {
                    // Decrease Step Goal Button
                    Button(action: {
                        let newGoal = max(stepTrackerViewModel.stepTracker.totalStepsGoal - 250, 1000) // Min 1000
                        stepTrackerViewModel.updateTotalStepsGoal(to: newGoal)
                    }) {
                        Image(systemName: "minus.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(stepTrackerViewModel.stepTracker.totalStepsGoal > 1000 ? .blue : .gray)
                    }
                    .disabled(stepTrackerViewModel.stepTracker.totalStepsGoal <= 1000)
                    
                    // Increase Step Goal Button
                    Button(action: {
                        let newGoal = min(stepTrackerViewModel.stepTracker.totalStepsGoal + 250, 50000) // Max 50,000
                        stepTrackerViewModel.updateTotalStepsGoal(to: newGoal)
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(stepTrackerViewModel.stepTracker.totalStepsGoal < 50000 ? .blue : .gray)
                    }
                    .disabled(stepTrackerViewModel.stepTracker.totalStepsGoal >= 50000)
                }
            }
            .padding()
            
            // MARK: - Energy Replenish (Debugging - Optional)
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
    SettingsView(
        playerStatsViewModel: PlayerStatsViewModel(),
        stepTrackerViewModel: StepTrackerViewModel()
    )
}

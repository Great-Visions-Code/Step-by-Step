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
    @ObservedObject var stepTrackingViewModel: StepTrackerViewModel
    
    /// UserDefaults key for persisting the total step goal.
    private let totalStepsGoalKey = "totalStepsGoalKey"
    
    /// Load the saved total step goal from UserDefaults, or default to 5,000.
    @State private var totalStepsGoal: Int = UserDefaults.standard.integer(forKey: "totalStepsGoal") == 0 ? 5000 : UserDefaults.standard.integer(forKey: "totalStepsGoal")
    
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
                
                // Display current totalStepsGoal
                Text("\(totalStepsGoal) Steps")
                    .font(.title)
                    .bold()
                
                HStack(spacing: 30) {
                    // Decrease Step Goal Button
                    Button(action: {
                        if totalStepsGoal > 1000 { // Prevents goal from going below 1,000
                            totalStepsGoal -= 250 // Intervals of 250
                            updateTotalStepsGoal()
                        }
                    }) {
                        Image(systemName: "minus.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(totalStepsGoal > 1000 ? .blue : .gray)
                    }
                    .disabled(totalStepsGoal <= 1000)
                    
                    // Increase Step Goal Button
                    Button(action: {
                        if totalStepsGoal < 50000 { // Prevents goal from exceeding 50,000
                            totalStepsGoal += 250 // Intervals of 250
                            updateTotalStepsGoal()
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(totalStepsGoal < 50000 ? .blue : .gray)
                    }
                    .disabled(totalStepsGoal >= 50000)
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
    
    /// Saves the updated `totalStepsGoal` to UserDefaults and updates `StepTrackerViewModel`.
    private func updateTotalStepsGoal() {
        UserDefaults.standard.set(totalStepsGoal, forKey: totalStepsGoalKey)
        stepTrackingViewModel.updateTotalStepsGoal(to: totalStepsGoal)
    }
}

#Preview {
    SettingsView(playerStatsViewModel: PlayerStatsViewModel(),
                 stepTrackingViewModel: StepTrackerViewModel()
    )
}

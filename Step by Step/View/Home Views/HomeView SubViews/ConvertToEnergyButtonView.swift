//
//  ConvertToEnergyButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

/// A button that converts the user's current steps into energy points.
///
/// This view encourages user activity by converting real-world steps into
/// game energy, rewarding progress toward their daily step goal.
struct ConvertToEnergyButtonView: View {
    /// ViewModel for managing player stats, such as health and energy points.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel

    /// ViewModel for managing steps taken and goals.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    var body: some View {
        // A button that performs the steps-to-energy conversion and resets steps.
        Button(action: {
            // Calculate energy points based on the user's progress toward their step goal in ViewModel.
            // Add calculatedEnergyPoints to current energy.
            let newEnergy = stepTrackerViewModel.calculateEnergyPoints() + playerStatsViewModel.playerStats.energy
            
            // Update the energy points in the player stats ViewModel.
            playerStatsViewModel.updateEnergy(to: newEnergy)
            
            // Reset the current steps in ViewModel.
            stepTrackerViewModel.resetStepsToConvert()
        }) {
            VStack(spacing: 15) {
                Text("Convert")
                    .font(.title2)
                HStack(spacing: 10) {
                    Text("\(stepTrackerViewModel.stepTracker.stepsToConvert) steps")
                        .foregroundStyle(.yellow)
                    Image(systemName: "arrow.right.circle.fill")
                    Text("To Energy")
                }
            }
            .font(.title3)
            .bold()
            .padding()
            .background(Color.blue)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct ConvertToEnergyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        let playerStatsViewModel = PlayerStatsViewModel()
        let stepTrackerViewModel = StepTrackerViewModel()
        
        return ConvertToEnergyButtonView(
            playerStatsViewModel: playerStatsViewModel,
            stepTrackerViewModel: stepTrackerViewModel
        )
    }
}

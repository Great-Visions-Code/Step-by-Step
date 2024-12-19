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

    /// Binding to track the current steps taken by the user.
    @Binding var currentStepsTaken: Int
    /// Binding to track the user's total step goal.
    @Binding var totalStepsGoal: Int
    
    var body: some View {
        // A button that performs the steps-to-energy conversion and resets steps.
        Button(action: {
            // Calculate energy points based on the user's progress toward their step goal.
            let newEnergy = ConvertToEnergyViewModel.calculateStepsToEnergy(
                currentStepsTaken: currentStepsTaken,
                totalStepsGoal: totalStepsGoal
            )
            // Update the energy points in the player stats ViewModel.
            playerStatsViewModel.updateEnergy(to: newEnergy)
            // Reset the current steps to zero after conversion.
            currentStepsTaken = 0
        }) {
            Text("Convert to Energy")
                .font(.title2)
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
        @State var stepsTaken = 5000
        @State var stepGoal = 10000
        let playerStatsViewModel = PlayerStatsViewModel()
        
        return ConvertToEnergyButtonView(
            playerStatsViewModel: playerStatsViewModel,
            currentStepsTaken: $stepsTaken,
            totalStepsGoal: $stepGoal
        )
    }
}

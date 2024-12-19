//
//  ConvertToEnergyButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

struct ConvertToEnergyButtonView: View {
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel

    // Binding variables to allow 2-way data flow
    @Binding var currentStepsTaken: Int
    @Binding var totalStepsGoal: Int
    
    var body: some View {
        // Button to convert currentStepsTaken to currentEnergyPoints
        Button(action: {
            // Function call [current EP = (currentStepsTaken / totalStepsGoal)]
            let newEnergy = ConvertToEnergyViewModel.calculateStepsToEnergy(
                currentStepsTaken: currentStepsTaken,
                totalStepsGoal: totalStepsGoal
            )
            playerStatsViewModel.updateEnergy(to: newEnergy)
            // Reset steps
            currentStepsTaken = 0
        }) {
            // Text for button
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

//
//  ConvertToEnergyButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

struct ConvertToEnergyButtonView: View {
    // Binding variables to allow 2-way data flow with DashboardView.swift
    @Binding var currentStepsTaken: Int
    @Binding var totalStepsGoal: Int
    @Binding var currentEnergyPoints: Int
    
    var body: some View {
        // Button to convert currentStepsTaken to currentEnergyPoints
        Button(action: {
            // Function call [current EP = (currentStepsTaken / totalStepsGoal)]
            currentEnergyPoints = ConvertToEnergyViewModel.calculateStepsToEnergy(
                currentStepsTaken: currentStepsTaken,
                totalStepsGoal: totalStepsGoal
            )
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
                .cornerRadius(20)
        }
    }
}

struct ConvertToEnergyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        // State variables to simulate bindings for preview
        @State var stepsTaken = 5000
        @State var stepGoal = 10000
        @State var energyPoints = 0
        
        return ConvertToEnergyButtonView(
            currentStepsTaken: $stepsTaken,
            totalStepsGoal: $stepGoal,
            currentEnergyPoints: $energyPoints
        )
    }
}

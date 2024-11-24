//
//  DashboardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

struct DashboardView: View {
    // Variables used for testing with default values
    @State private var totalStepsGoal: Int = 10000
    @State private var currentStepsTaken: Int = 5000
    @State private var currentEnergyPoints: Int = 0
    
    var body: some View {
        VStack {
            // MARK: currentStepsTakenProgressView.swift GV 11/23/24
            /*
             TODO: Circular progress bar GV 11/22/24
                - Total should be totalStepsGoal
                - Progress should be tracked based on currentStepsTaken
            */
            Text("Steps Taken:")
                .font(.title)
                .bold()
                .padding(.bottom, 2)
            
            // NOTE: Temporary display text in place of circular progress bar GV 11/22/24
            Text("\(currentStepsTaken) out of a goal of \(totalStepsGoal)")
                .font(.headline)
                .padding(.bottom)
            
            // MARK: convertToEnergyButtonView.swift GV 11/23/24
            // Button to convert currentStepsTaken to currentEnergyPoints
            Button(action: {
                convertCurrentStepsTakenToCurrentEnergyPoints()
            }) {
                Text("Convert to Energy")
                    .font(.title2)
                    .bold()
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(20)
            }
            
            // Displays currentEnergyPoints
            Text("Current Energy: \(currentEnergyPoints)")
                .font(.headline)
                .padding(.top)
        }
        .padding()
    }
    
    // MARK: Function goes with convertToEnergyButtonView.swift GV 11/23/24
    // Function to convert currentStepsTaken to currentEnergyPoints
    private func convertCurrentStepsTakenToCurrentEnergyPoints() {
        // Calculate the energy based on the ratio
        let energyRatio = Double(currentStepsTaken) / Double(totalStepsGoal)
        let calculatedEnergy = Int(energyRatio * 10)
        // Updates currentEnergyPoints ensuring max of 10 energyPoints
        currentEnergyPoints = min(calculatedEnergy, 10)
        // Reset currentStepsTaken
        currentStepsTaken = 0
    }
}

#Preview {
    DashboardView()
}

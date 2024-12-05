//
//  ConvertToEnergyViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/4/24.
//

import Foundation

struct ConvertToEnergyViewModel {
    static func calculateStepsToEnergy(
        currentStepsTaken: Int,
        totalStepsGoal: Int) -> Int {
            // totalStepsGoal cannot be zero to prevent division by zero errors.
            //guard totalStepsGoal > 0 else { return 0 }
            // Calculate the energy based on the ratio
            let energyRatio = Double(currentStepsTaken) / Double(totalStepsGoal)
            let calculatedEnergy = Int(energyRatio * 10)
            // Updates currentEnergyPoints ensuring max of 10 energyPoints
            return min(calculatedEnergy, 10)
    }
}

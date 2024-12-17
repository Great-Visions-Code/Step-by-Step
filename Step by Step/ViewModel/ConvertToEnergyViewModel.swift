//
//  ConvertToEnergyViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/4/24.
//

import Foundation

// This ViewModel handles the logic for converting steps taken into energy points.
// The energy points are capped at a maximum value to align with the game's mechanics.
struct ConvertToEnergyViewModel {
    /// Calculates energy points based on the current steps taken relative to the total step goal.
    /// - Parameters:
    ///   - currentStepsTaken: The number of steps the user has currently taken.
    ///   - totalStepsGoal: The total step goal set for the user.
    /// - Returns: An integer representing the calculated energy points (capped at a maximum of 10).
    static func calculateStepsToEnergy(
        currentStepsTaken: Int,
        totalStepsGoal: Int
    ) -> Int {
        // Step 1: Prevent division by zero
        // If totalStepsGoal is zero or less, return 0 energy points as a safeguard.
        guard totalStepsGoal > 0 else {
            return 0
        }
        // Step 2: Calculate energy ratio
        // Compute the ratio of current steps taken to the total step goal.
        // Convert the result into a Double for precise calculations.
        let energyRatio = Double(currentStepsTaken) / Double(totalStepsGoal)
        
        // Step 3: Scale the energy ratio to match a maximum value of 10
        // Multiply the energy ratio by 10 to determine the energy points earned.
        let calculatedEnergy = Int(energyRatio * 10)
        
        // Step 4: Cap the energy points at a maximum of 10
        // Ensure that the returned value does not exceed 10 energy points.
        return min(calculatedEnergy, 10)
    }
}

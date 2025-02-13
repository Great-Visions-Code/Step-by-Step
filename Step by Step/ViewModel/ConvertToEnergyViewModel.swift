//
//  ConvertToEnergyViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/4/24.
//

import SwiftUI

/// ViewModel responsible for converting steps taken into energy points.
///
/// This ViewModel provides a static utility method to calculate energy points
/// based on the user's progress toward their daily step goals.
/// Energy points are capped at a maximum value to encourage balanced progression.
struct ConvertToEnergyViewModel {
    /// Converts the user's current steps into energy points.
    ///
    /// This function translates real-world steps into a gamified energy system,
    /// incentivizing users to achieve their step goals.
    /// Energy points are calculated by dividing steps into fixed intervals (`energyCost`).
    ///
    /// - Parameters:
    ///   - stepsToConvert: The steps available to convert to energy points.
    ///   - totalStepsGoal: The user's total step goal for the day.
    /// - Returns: A tuple containing:
    ///     - `energyPoints`: The energy points earned from the conversion.
    ///     - `remainingSteps`: The leftover steps that weren't converted.
    static func calculateStepsToEnergy(
        stepsToConvert: Int,
        totalStepsGoal: Int
    ) -> (energyPoints: Int, remainingSteps: Int) {
        // Validate the total step goal to prevent division by zero.
        guard totalStepsGoal > 0 else {
            return (0, stepsToConvert) // Returns 0 energy points and keeps all steps.
        }
        
        // Determine how many steps are needed per 1 energy point.
        let energyCost = totalStepsGoal / 10 // Divides step goal into 10 energy segments.
        
        // Calculate the energy points that can be earned in full `energyCost` intervals.
        let energyPoints = stepsToConvert / energyCost
        
        // Determine the leftover steps after conversion.
        let remainingSteps = stepsToConvert % energyCost
        
        // Return both the energy points earned and the remaining steps. 
        return (energyPoints, remainingSteps)
    }
}

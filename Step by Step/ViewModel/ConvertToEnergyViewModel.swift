//
//  ConvertToEnergyViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/4/24.
//

import SwiftUI

/// ViewModel responsible for converting steps taken into energy points.
/// Energy points are used in the app's mechanics and are capped at a maximum value.
struct ConvertToEnergyViewModel {
    
    /// Converts the user's current steps into energy points based on their step goal.
    ///
    /// This function ensures that energy points are scaled to a range of 0 to 10, providing a gamified incentive for users to achieve their step goals.
    ///
    /// - Parameters:
    ///   - stepsToConvert: The number of steps the user has taken so far.
    ///   - totalStepsGoal: The user's total step goal for the day.
    /// - Returns: An integer representing the calculated energy points (capped at 10).
    static func calculateStepsToEnergy(
        stepsToConvert: Int,
        totalStepsGoal: Int
    ) -> Int {
        // Step 1: Validate the total step goal.
        // Prevent division by zero by returning 0 energy points if the goal is invalid.
        guard totalStepsGoal > 0 else {
            return 0
        }
        
        // Step 2: Calculate the steps to completion ratio.
        // Divide the current steps taken by the total step goal to get a ratio.
        let stepsToCompletionRatio = Double(stepsToConvert) / Double(totalStepsGoal)
        
        // Step 3: Scale the steps to completion ratio to a maximum of 10 energy points.
        // Multiply the ratio by 10 to determine the energy points earned.
        let calculatedEnergy = Int(stepsToCompletionRatio * 10)
        
        // Step 4: Cap the energy points at 10.
        // Ensure the calculated energy points do not exceed the maximum allowed value.
        return min(calculatedEnergy, 10)
    }
}

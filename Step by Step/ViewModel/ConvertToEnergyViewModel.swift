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
    /// Energy points are calculated as a ration of steps taken to the total steps goal,
    /// scaled to a maximum of 10 points.
    ///
    /// - Parameters:
    ///   - stepsToConvert: The steps available to convert to energy points.
    ///   - totalStepsGoal: The user's total step goal for the day.
    /// - Returns: An integer representing the calculated energy points, capped at 10.
    static func calculateStepsToEnergy(
        stepsToConvert: Int,
        totalStepsGoal: Int
    ) -> Int {
        // Validate the total step goal to prevent division by zero.
        guard totalStepsGoal > 0 else {
            return 0 // Return 0 energy points if the goal is invalid.
        }
        
        // Calculate the ratio of steps taken to the total step goal.
        let stepsToCompletionRatio = Double(stepsToConvert) / Double(totalStepsGoal)
        
        // Scale the ratio to a maximum of 10 energy points.
        let calculatedEnergy = Int(stepsToCompletionRatio * 10)
        
        // Cap the energy points at 10 to maintain balance in the game mechanics.
        return min(calculatedEnergy, 10)
    }
}

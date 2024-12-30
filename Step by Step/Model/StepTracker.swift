//
//  StepTracker.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/19/24.
//

import Foundation
import SwiftUI

/// Model representing the user's step tracking progress and goals.
/// This struct handles the user's daily step goals and tracks steps taken,
/// as well as providing utilities to calculate progress and reset steps.
struct StepTracker {
    /// The number of steps available for conversion into energy points.
    var stepsToConvert: Int
    
    /// The total number of steps required to meet the user's daily goal.
    var totalStepsGoals: Int
    
    /// The current number of steps taken as reported by HealthKit or a similar step-tracking service.
    var healthKitImportedCurrentStepsTaken: Int
    
    // TODO: To be used in CurrentStepsTakenView.swift
    /// Calculate the user's progress as a percentage.
    ///
    /// This function calculates the progress towards the daily step goal.
    /// If the `totalStepsGoals` is 0, it safely returns 0 to avoid division by zero errors.
    ///
    /// - Returns: A value between 0 and 100 representing the progress percentage.
    func progressPercentage() -> Double {
        guard totalStepsGoals > 0 else { return 0 } // Ensure a valid goal is set.
        return (Double(stepsToConvert) / Double(totalStepsGoals)) * 100
    }
    
    /// Resets the current steps available for conversion to zero.
    ///
    /// This method is typically used when the steps have been converted into energy
    /// or at the start of a new tracking period.
    mutating func resetSteps() {
        stepsToConvert = 0
    }
}

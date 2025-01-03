//
//  StepTrackerViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/19/24.
//

import SwiftUI

/// ViewModel for managing step tracking data and logic.
///
/// This ViewModel provides functionality for managing the user's steps,
/// including setting goals, resetting steps, and converting steps into energy points.
class StepTrackerViewModel: ObservableObject {
    /// Published property for step tracking data, allowing views to observe changes.
    /// Any updates to this property will automatically refresh the associated UI.
    @Published private(set) var stepTracker: StepTracker
    
    /// Initializes the ViewModel with default or custom values for steps and goals.
    ///
    /// - Parameters:
    ///   - stepsToConvert: The initial number of steps available for conversion (default is 0).
    ///   - totalStepsGoal: The initial daily step goal (default is 5,000).
    ///   - healthKitImportedCurrentStepsTaken: The current number of steps taken,
    ///    as reported by HealthKit or similar services (default is 0).
    init(
        stepsToConvert: Int = 2500,
        totalStepsGoal: Int = 5000,
        healthKitImportedCurrentStepsTaken: Int = 0
    ) {
        self.stepTracker = StepTracker(
            stepsToConvert: stepsToConvert,
            totalStepsGoals: totalStepsGoal,
            healthKitImportedCurrentStepsTaken: healthKitImportedCurrentStepsTaken
        )
    }
    
    /// Resets the current steps available for conversion to zero.
    ///
    /// Typically used after converting steps to energy or at the start of a new day.
    func resetStepsToConvert() {
        stepTracker.stepsToConvert = 0
    }
    
    /// Calculates the energy points based on the user's steps and goal.
    ///
    /// This method uses the `ConvertToEnergyViewModel` to determine the energy points earned
    /// by scaling the user's steps to a maximum of 10 energy points.
    ///
    /// - Returns: The calculated energy points (capped at 10).
    func calculateEnergyPoints() -> Int {
        return ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTracker.stepsToConvert,
            totalStepsGoal: stepTracker.totalStepsGoals
        )
    }
}

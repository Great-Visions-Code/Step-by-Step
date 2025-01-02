//
//  StepTrackerViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/19/24.
//

import SwiftUI

/// ViewModel for managing step-tracking data and logic.
class StepTrackerViewModel: ObservableObject {
    /// Published step tracker data, allowing views to observe changes.
    @Published private(set) var stepTracker: StepTracker
    
    /// Initializes the ViewModel with default or custom values.
    /// - Parameters:
    ///   - stepsToConvert: The initial number of steps taken (default is 0).
    ///   - totalStepsGoal: The initial step goal (default is 5,000).
    init(stepsToConvert: Int = 2500, totalStepsGoal: Int = 5000, healthKitImportedCurrentStepsTaken: Int = 0) {
        self.stepTracker = StepTracker(
            stepsToConvert: stepsToConvert,
            totalStepsGoals: totalStepsGoal,
            healthKitImportedCurrentStepsTaken: healthKitImportedCurrentStepsTaken
        )
    }
    
    // TODO: func will be used in SettingsView to update step goal.
    /// Updates the total steps goal.
    /// - Parameter goal: The new step goal to set.
    func updateStepGoal(to goal: Int) {
        stepTracker.totalStepsGoals = goal
    }
    
    /// Resets the current steps to zero.
    func resetSteps() {
        stepTracker.stepsToConvert = 0
    }
    
    /// Calculates the energy points based on steps taken and the step goal.
    /// - Returns: The calculated energy points (capped at 10).
    func calculateEnergyPoints() -> Int {
        return ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTracker.stepsToConvert,
            totalStepsGoal: stepTracker.totalStepsGoals
        )
    }
}

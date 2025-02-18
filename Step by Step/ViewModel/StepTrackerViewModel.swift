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
    
    /// Instance of HealthKitViewModel to fetch real step count data.
    private let healthKitViewModel = HealthKitViewModel()
    
    /// Key for UserDefaults storage.
    private static let totalStepsTakenKey = "totalStepsTaken"
    private static let lastResetDateKey = "lastResetDate"
    private static let totalStepsGoalKey = "totalStepsGoal"
    
    /// Initializes the ViewModel with persistent values for steps and goals.
    init(totalStepsGoal: Int? = nil) {
        let savedTotalStepsGoal = UserDefaults.standard.integer(forKey: Self.totalStepsGoalKey)
        let finalTotalStepsGoal = savedTotalStepsGoal > 0 ? savedTotalStepsGoal : 5000 // Ensure fallback
        
        let savedTotalStepsTaken = StepTrackerViewModel.loadTotalStepsTaken() // Load persisted value
        self.stepTracker = StepTracker(
            currentStepCount: 0, // Initially 0, will update from HealthKit.
            totalStepsGoal: finalTotalStepsGoal, // Load from UserDefaults
            totalStepsTaken: savedTotalStepsTaken
        )
        // Ensures daily reset
        checkAndResetStepsAtMidnight()
        
        // Update step count after authorization
        updateCurrentStepCount()
    }
    
    /// Updates `currentStepCount` by fetching the latest step count from HealthKit.
    func updateCurrentStepCount() {
        healthKitViewModel.updateStepCount()
        
        // Assign the fetched step count to stepTracker
        DispatchQueue.main.async { [weak self] in
            self?.stepTracker.currentStepCount = self?.healthKitViewModel.hkCurrentStepsCount ?? 0
        }
    }
    
    /// Updates the current step count from HealthKit.
    ///
    /// - Parameter newStepCount: The updated step count retrieved from HealthKit.
    func updateCurrentSteps(to newStepCount: Int) {
        stepTracker.currentStepCount = newStepCount
        print("(STVM) StepTrackerViewModel updated step count: \(newStepCount) ✅")
    }
    
    /// Converts steps into energy and updates the tracker.
    ///
    /// Ensures that only full intervals of `energyCost` are converted, leaving
    /// any unconverted steps available for the next conversion.
    ///
    /// - Parameter updateEnergy: A closure that updates energy in `PlayerStatsViewModel`.
    func commitStepsToTotal(updateEnergy: (Int) -> Void) {
        let (energyPoints, remainingSteps) = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTracker.stepsToConvert,
            totalStepsGoal: stepTracker.totalStepsGoal
        )

        // Update total steps taken by subtracting only the converted steps.
        stepTracker.totalStepsTaken += (stepTracker.stepsToConvert - remainingSteps)

        // Persist the updated total steps.
        StepTrackerViewModel.saveTotalStepsTaken(stepTracker.totalStepsTaken)

        print("(STVM) Energy Added: \(energyPoints) ⚡️ | Remaining Steps: \(remainingSteps) 🚶‍♂️")
    }
    
    /// Checks if it's a new day and resets  `totalStepsTaken` if needed.
    private func checkAndResetStepsAtMidnight() {
        let lastResetDate = UserDefaults.standard.object(forKey: Self.lastResetDateKey) as? Date ?? Date.distantPast
        let calendar = Calendar.current
        
        if !calendar.isDate(lastResetDate, inSameDayAs: Date()) {
            stepTracker.totalStepsTaken = 0
            StepTrackerViewModel.saveTotalStepsTaken(0) // Reset value in storage
            UserDefaults.standard.set(Date(), forKey: Self.lastResetDateKey) // Save new reset date
            print("Total steps reset at midnight")
        }
    }
    
    // MARK: - Persistence Functions
    
    /// Saves the total steps taken persistently
    ///
    /// - Parameter totalSteps: The updated total steps value.
    static func saveTotalStepsTaken(_ totalSteps: Int) {
        UserDefaults.standard.set(totalSteps, forKey: totalStepsTakenKey)
    }
    
    /// Loads the persisted total steps taken value.
    ///
    /// - Returns: The saved total steps or 0 if no value exists.
    static func loadTotalStepsTaken() -> Int {
        return UserDefaults.standard.integer(forKey: totalStepsTakenKey)
    }
    
    /// Updates the total step goal and persists the value.
    ///
    /// - Parameter newGoal: The updated daily step goal.
    func updateTotalStepsGoal(to newGoal: Int) {
        stepTracker = StepTracker(
            currentStepCount: stepTracker.currentStepCount,
            totalStepsGoal: newGoal,
            totalStepsTaken: stepTracker.totalStepsTaken
        )
        
        UserDefaults.standard.set(newGoal, forKey: Self.totalStepsGoalKey) // Persist updated goal
        print("(STVM) Updated Step Goal: \(newGoal) Steps 🎯")
    }
    
    /// Calculates the energy points based on the user's steps and goal.
    ///
    /// This method retrieves the energy points from the `ConvertToEnergyViewModel`,
    /// ensuring only full `energyCost` intervals are converted.
    ///
    /// - Returns: The calculated energy points (capped at 10).
    func calculateEnergyPoints() -> Int {
        let (energyPoints, _) = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTracker.stepsToConvert,
            totalStepsGoal: stepTracker.totalStepsGoal
        )
        return energyPoints
    }
    
    // MARK: - Functions primarily used for testing/debugging purposes
    
    /// Updates `totalStepsTaken` manually (for testing/debugging purposes).
    ///
    /// - Parameter steps: The new total steps taken value.
    func setTotalStepsTaken(_ steps: Int) {
        stepTracker = StepTracker(
            currentStepCount: stepTracker.currentStepCount,
            totalStepsGoal: stepTracker.totalStepsGoal,
            totalStepsTaken: steps
        )
    }
}

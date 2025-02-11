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
    
    /// Initializes the ViewModel with persistent values for steps and goals.
    ///
    /// - Parameters:
    ///   - totalStepsGoal: The daily step goal (default is 10,000).
    init(totalStepsGoal: Int = 10000) {
        let savedTotalStepsTaken = StepTrackerViewModel.loadTotalStepsTaken() // Load persisted value
        self.stepTracker = StepTracker(
            currentStepCount: 0, // Initially 0, will update from HealthKit.
            totalStepsGoal: totalStepsGoal,
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
    
    /// Resets the current steps available for conversion to zero.
    ///
    /// Typically used after converting steps to energy or at the start of a new day.
    func commitStepsToTotal() {
        stepTracker.totalStepsTaken += stepTracker.stepsToConvert
        StepTrackerViewModel.saveTotalStepsTaken(stepTracker.totalStepsTaken) // Persist updated total steps
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
    
    /// Calculates the energy points based on the user's steps and goal.
    ///
    /// This method uses the `ConvertToEnergyViewModel` to determine the energy points earned
    /// by scaling the user's steps to a maximum of 10 energy points.
    ///
    /// - Returns: The calculated energy points (capped at 10).
    func calculateEnergyPoints() -> Int {
        return ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTracker.stepsToConvert,
            totalStepsGoal: stepTracker.totalStepsGoal
        )
    }
}

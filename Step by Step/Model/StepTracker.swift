//
//  StepTracker.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/19/24.
//

import Foundation

/// A model representing the user's step-tracking progress and goals.
///
/// This struct manages daily steps goals, tracks steps taken, and provides utilities
/// for calculation progress and resetting steps when needed.
struct StepTracker {
    /// The number of steps available for conversion into energy points.
    var stepsToConvert: Int
    
    /// The total number of steps required to meet the user's daily goal.
    var totalStepsGoals: Int
    
    /// The current number of steps taken, imported from HealthKit or a similar service.
    var healthKitImportedCurrentStepsTaken: Int
}

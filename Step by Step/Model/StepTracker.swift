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
    /// The current step count.
    var currentStepCount: Int
    /// The total number of steps required to meet the user's daily goal.
    var totalStepsGoal: Int
    /// The current distance traveled data. 
    var currentDistance: Double
    /// The total number of steps taken. 
    var totalStepsTaken: Int {
        didSet {
            StepTrackerViewModel.saveTotalStepsTaken(totalStepsTaken) // Persist when updated
        }
    }
    /// The number of steps available for conversion into energy points.
    ///
    /// This value is calculated as `currentStepCount - totalStepsTaken`.
    var stepsToConvert: Int {
        max(currentStepCount - totalStepsTaken, 0)
    }
    /// The average step count for the past 7-days.
    var sevenDayStepAverage: Double = 0.0
    /// The daily step history.
    var stepHistory: [(date: String, steps: Int)] = []
}

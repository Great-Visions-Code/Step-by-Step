//
//  StepTracker.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/19/24.
//

import Foundation

/// A structure that represents the user's step tracking progress and goals.
///
/// `StepTracker` manages step-related data sourced from HealthKit,
/// such as the number of steps taken today, the user’s daily step goal,
/// distance walked or run, and historical step data. It also tracks
/// the number of steps that are eligible for energy conversion.
struct StepTracker {
    
    // MARK: - Properties

    /// The number of steps taken by the user so far today.
    ///
    /// This value is retrieved from HealthKit and resets each day.
    var currentStepCount: Int

    /// The user-defined goal for total steps in a day.
    ///
    /// This value is used to measure goal completion percentage and energy conversion scaling.
    var totalStepsGoal: Int

    /// The total distance traveled today, measured in miles.
    ///
    /// This value is derived from HealthKit’s walking/running distance sample.
    var currentDistance: Double

    /// The cumulative number of steps the user has committed for energy conversion.
    ///
    /// This value persists between sessions and resets at midnight.
    var totalStepsTaken: Int {
        didSet {
            // Persist the updated value
            StepTrackerViewModel.saveTotalStepsTaken(totalStepsTaken)
        }
    }

    /// The number of steps available for conversion into energy points.
    ///
    /// This is a computed value based on the difference between steps taken today
    /// (`currentStepCount`) and those already committed (`totalStepsTaken`).
    ///
    /// Returns `0` if the result would be negative.
    var stepsToConvert: Int {
        max(currentStepCount - totalStepsTaken, 0)
    }

    /// The average number of steps taken over the past 7 days.
    ///
    /// Used for analytics and achievement milestones.
    var sevenDayStepAverage: Double = 0.0

    /// A history of the user’s daily step counts.
    ///
    /// Each tuple contains a formatted date string (e.g., "3/27/25") and step count for that day.
    var stepHistory: [(date: String, steps: Int)] = []
}

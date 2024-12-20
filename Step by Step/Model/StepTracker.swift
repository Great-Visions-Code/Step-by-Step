//
//  StepTracker.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/19/24.
//

import Foundation
import SwiftUI

/// Model representing the user's step tracking progress and goals.
struct StepTracker {
    var currentStepsTaken: Int
    var totalStepsGoals: Int
    
    /// Calculate the user's progress as a percentage.
    /// - Returns: A value between 0 and 100  representing the progress percentage.
    func progressPercentage() -> Double {
        guard totalStepsGoals > 0 else { return 0 }
        return (Double(currentStepsTaken) / Double(totalStepsGoals)) * 100
    }
    
    /// Resets the current steps to zero.
    mutating func resetSteps() {
        currentStepsTaken = 0
    }
}

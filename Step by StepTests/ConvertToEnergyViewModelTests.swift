//
//  ConvertToEnergyViewModelTests.swift
//  Step by StepTests
//
//  Created by Gustavo Vazquez on 12/4/24.
//

import XCTest

final class ConvertToEnergyViewModelTests: XCTestCase {
        func testCalculateStepsToEnergy() {
            // Test Case 1: Steps are half the goal
            let stepsTaken = 5000
            let stepGoal = 10000
            let energyPoints = ConvertToEnergyViewModel.calculateStepsToEnergy(
                currentStepsTaken: stepsTaken,
                totalStepsGoal: stepGoal
            )
            XCTAssertEqual(energyPoints, 5, "Energy points should be 5 when steps are half the goal.")
            
            // Test Case 2: Steps meet the goal
            let fullStepsTaken = 10000
            let fullEnergyPoints = ConvertToEnergyViewModel.calculateStepsToEnergy(
                currentStepsTaken: fullStepsTaken,
                totalStepsGoal: stepGoal
            )
            XCTAssertEqual(fullEnergyPoints, 10, "Energy points should be 10 when steps meet the goal.")
            
            // Test Case 3: Steps exceed the goal
            let extraStepsTaken = 15000
            let maxEnergyPoints = ConvertToEnergyViewModel.calculateStepsToEnergy(
                currentStepsTaken: extraStepsTaken,
                totalStepsGoal: stepGoal
            )
            XCTAssertEqual(maxEnergyPoints, 10, "Energy points should not exceed 10 even if steps exceed the goal.")
            
            // Test Case 4: No steps taken
            let noStepsTaken = 0
            let zeroEnergyPoints = ConvertToEnergyViewModel.calculateStepsToEnergy(
                currentStepsTaken: noStepsTaken,
                totalStepsGoal: stepGoal
            )
            XCTAssertEqual(zeroEnergyPoints, 0, "Energy points should be 0 when no steps are taken.")
            
            // Test Case 5: Total steps goal is zero
            let goalIsZero = 0
            let energyPointsWithZeroGoal = ConvertToEnergyViewModel.calculateStepsToEnergy(
                currentStepsTaken: stepsTaken,
                totalStepsGoal: goalIsZero
            )
            XCTAssertEqual(energyPointsWithZeroGoal, 0, "Energy points should be 0 when total steps goal is 0.")
        }
}

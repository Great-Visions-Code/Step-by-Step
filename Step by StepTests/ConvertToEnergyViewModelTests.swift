//
//  ConvertToEnergyViewModelTests.swift
//  Step by StepTests
//
//  Created by Gustavo Vazquez on 12/4/24.
//

import XCTest

/// Unit tests for the `ConvertToEnergyViewModel`'s functionality of converting steps to energy points.
final class ConvertToEnergyViewModelTests: XCTestCase {
    
    /// Tests the `calculateStepsToEnergy` method to ensure accurate energy point calculations
    /// under different scenarios, such as meeting or exceeding step goals, and edge cases.
    func testCalculateStepsToEnergy() {
        // Test Case 1: Steps are half the goal
        // Ensures energy points scale proportionally when halfway to the goal.
        let stepsTaken = 5000
        let stepGoal = 10000
        let energyPoints = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepsTaken,
            totalStepsGoal: stepGoal
        )
        XCTAssertEqual(energyPoints, 5, "Energy points should be 5 when steps are half the goal.")
        
        // Test Case 2: Steps meet the goal
        // Verifies that energy points equal the maximum when the step goal is met.
        let fullStepsTaken = 10000
        let fullEnergyPoints = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: fullStepsTaken,
            totalStepsGoal: stepGoal
        )
        XCTAssertEqual(fullEnergyPoints, 10, "Energy points should be 10 when steps meet the goal.")
        
        // Test Case 3: Steps exceed the goal
        // Confirms that energy points are capped at the maximum even if steps exceed the goal.
        let extraStepsTaken = 15000
        let maxEnergyPoints = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: extraStepsTaken,
            totalStepsGoal: stepGoal
        )
        XCTAssertEqual(maxEnergyPoints, 10, "Energy points should not exceed 10 even if steps exceed the goal.")
        
        // Test Case 4: No steps taken
        // Ensures that zero steps result in zero energy points.
        let noStepsTaken = 0
        let zeroEnergyPoints = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: noStepsTaken,
            totalStepsGoal: stepGoal
        )
        XCTAssertEqual(zeroEnergyPoints, 0, "Energy points should be 0 when no steps are taken.")
        
        // Test Case 5: Total steps goal is zero
        // Validates behavior when the step goal is zero, ensuring no energy points are awarded.
        let goalIsZero = 0
        let energyPointsWithZeroGoal = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepsTaken,
            totalStepsGoal: goalIsZero
        )
        XCTAssertEqual(energyPointsWithZeroGoal, 0, "Energy points should be 0 when total steps goal is 0.")
    }
}

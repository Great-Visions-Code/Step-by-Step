//
//  HealthKitViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 02/07/25.
//

import SwiftUI

/// ViewModel responsible for managing HealthKit integration and updating step count.
class HealthKitViewModel: ObservableObject {
    /// Stores the latest step count fetched from HealthKit.
    @Published var hkCurrentStepsCount: Int = 0
    /// Stores the latest distance traveled data from HealthKit.
    @Published var hkCurrentDistance: Double = 0.0
    /// Stores the calculated 7-day average step count from HealthKit.
    @Published var hkSevenDayStepAverage: Double = 0.0
    /// Stores 7-day step data.
    @Published var hkStepHistory: [String: Int] = [:]
    
    /// Initializes the ViewModel and requests authorization.
    init() {
        requestHealthKitAuthorization()
    }

    /// Requests HealthKit authorization.
    func requestHealthKitAuthorization() {
        HealthKitManager.shared.requestAuthorization { [weak self] success, error in
            if success {
                print("(HKVM) HealthKit authorization granted ✅.")
                self?.updateStepCount()
                self?.updateDistance()
            } else {
                print("❌ (HKVM) HealthKit authorization failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
    
    /// Updates `hkCurrentStepsCount` with the latest step count from HealthKit.
    func updateStepCount() {
        HealthKitManager.shared.fetchTodayStepCount { [weak self] steps, error in
            if let steps = steps {
                self?.hkCurrentStepsCount = steps
                print("(HKVM) HealthKitModel (stepCount) updated HealthKitViewModel (steps): \(steps) ✅")
            } else {
                print("❌ (HKVM) Failed to fetch steps: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
    
    /// Updates `hkCurrentDistance` with the latest distance traveled data from HealthKit.
    func updateDistance() {
        HealthKitManager.shared.fetchTodayDistance { [weak self] distance, error in
            if let distance = distance {
                self?.hkCurrentDistance = distance
                print("(HKVM) Updated distance: \(String(format: "%.2f", distance)) mi ✅")
            } else {
                print("❌ (HKVM) Failed to fetch distance: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
    
    /// Update `hkSevenDayStepAverage` with the calculated step average for the past 7-days from HealthKit.
    func updateSevenDayStepAverage() {
        HealthKitManager.shared.fetchSevenDayStepAverage { [weak self] average, error in
            if let average = average {
                self?.hkSevenDayStepAverage = average
                print("(HKVM) 7-Day Step Average Updated: \(Int(average)) ✅")
            } else {
                print("❌ (HKVM) Failed to fetch 7-day step average: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
    
    /// Updates`hkStepHistory` with the last 7 days of step count data from HealthKit.
    func updateStepHistory() {
        HealthKitManager.shared.fetchSevenDayStepHistory { [weak self] stepData, error in
            if let stepData = stepData {
                self?.hkStepHistory = stepData
                print("(HKVM) 7-Day Step History Updated: \(stepData) ✅")
            } else {
                print("❌ (HKVM) Failed to fetch step history: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}

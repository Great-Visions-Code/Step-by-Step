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
}

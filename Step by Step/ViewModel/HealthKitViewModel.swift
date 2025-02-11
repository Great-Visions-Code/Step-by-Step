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
                print("(HKVM) HealthKitViewModel updated hkCurrentStepsCount: \(steps) ✅")
            } else {
                print("❌ (HKVM) Failed to fetch steps: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}

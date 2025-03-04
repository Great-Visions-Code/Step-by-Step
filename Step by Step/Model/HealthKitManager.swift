//
//  HealthKitManager.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 02/07/25.
//

import HealthKit

/// Singleton class to manage HealthKit permissions and step count retrieval.
class HealthKitManager {
    /// Shared instance for global access.
    static let shared = HealthKitManager()
    
    /// HealthKit store reference.
    private let healthStore = HKHealthStore()
    
    /// The HealthKit step count type.
    private let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount)!

    /// Requests authorization to read step count data from HealthKit.
    ///
    /// - Parameter completion: Closure returning success status and an optional error.
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        let readTypes: Set = [stepCountType] // Requesting permission to read step data.
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            DispatchQueue.main.async {
                completion(success, error)
            }
        }
    }
    
    /// Fetches the total steps taken for the current day from HealthKit.
    ///
    /// - Parameter completion: Closure returning the step count or an error.
    func fetchTodayStepCount(completion: @escaping (Int?, Error?) -> Void) {
        let calendar = Calendar.current
        
        // Get the start of the current day (midnight) to retrieve only today's steps.
        let startOfDay = calendar.startOfDay(for: Date())
        
        // Create a predicate to filter HealthKit step data from midnight until now.
        let predicate = HKQuery.predicateForSamples(
            withStart: startOfDay,
            end: Date(),
            options: .strictStartDate
        )
        
        // Create a query to fetch cumulative step count for today.
        let query = HKStatisticsQuery(
            quantityType: stepCountType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { _, result, error in
            DispatchQueue.main.async {
                // Check for errors in retrieving step data.
                if let error = error {
                    print("❌ (HKM) Error fetching step count: \(error.localizedDescription)")
                    completion(nil, error)
                    return
                }
                
                // Ensure we received valid step data.
                guard let quantity = result?.sumQuantity() else {
                    print("❌ (HKM) No step count data found for today.")
                    completion(0, nil) // Return 0 steps if no data is available.
                    return
                }
                
                // Convert the retrieved quantity into an integer step count.
                let stepCount = Int(quantity.doubleValue(for: HKUnit.count()))
                
                // Log retrieved step count for debugging.
                print("(HKM) Steps retrieved from HealthKit: \(stepCount) ✅")
                
                // Return the fetched step count through the completion handler.
                completion(stepCount, nil)
            }
        }
        
        // Execute the query on HealthKit.
        healthStore.execute(query)
    }}

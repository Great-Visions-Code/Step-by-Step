//
//  HealthKitManager.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 02/07/25.
//

import HealthKit

/// A singleton class that manages HealthKit permissions and data retrieval
/// for step count, distance, and historical step data.
final class HealthKitManager {
    
    /// Shared instance for global access.
    static let shared = HealthKitManager()
    
    /// The HealthKit store used to access health data.
    private let healthStore = HKHealthStore()
    
    /// The HealthKit quantity type for step count.
    private let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
    
    /// The HealthKit quantity type for walking/running distance.
    private let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
    
    // MARK: - Authorization
    
    /// Requests permission to read step count and walking distance data.
    ///
    /// - Parameter completion: Completion handler returning authorization result.
    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
        let readTypes: Set = [stepCountType, distanceType]
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            DispatchQueue.main.async {
                completion(success, error)
            }
        }
    }
    
    // MARK: - Today’s Data

    /// Fetches today’s total step count.
    ///
    /// - Parameter completion: Completion handler with step count or error.
    func fetchTodayStepCount(completion: @escaping (Int?, Error?) -> Void) {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        
        let predicate = HKQuery.predicateForSamples(
            withStart: startOfDay,
            end: Date(),
            options: .strictStartDate
        )
        
        let query = HKStatisticsQuery(
            quantityType: stepCountType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { _, result, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ (HKM) Error fetching step count: \(error.localizedDescription)")
                    completion(nil, error)
                    return
                }
                
                guard let quantity = result?.sumQuantity() else {
                    print("❌ (HKM) No step count data found for today.")
                    completion(0, nil)
                    return
                }
                
                let stepCount = Int(quantity.doubleValue(for: .count()))
                print("(HKM) Steps retrieved from HealthKit: \(stepCount) ✅")
                completion(stepCount, nil)
            }
        }
        
        healthStore.execute(query)
    }
    
    /// Fetches today’s total distance walked or run.
    ///
    /// - Parameter completion: Completion handler with distance in miles or error.
    func fetchTodayDistance(completion: @escaping (Double?, Error?) -> Void) {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        
        let predicate = HKQuery.predicateForSamples(
            withStart: startOfDay,
            end: Date(),
            options: .strictStartDate
        )
        
        let query = HKStatisticsQuery(
            quantityType: distanceType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { _, result, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ (HKM) Error fetching distance: \(error.localizedDescription)")
                    completion(nil, error)
                    return
                }
                
                guard let quantity = result?.sumQuantity() else {
                    print("❌ (HKM) No distance data found for today.")
                    completion(0, nil)
                    return
                }
                
                let meters = quantity.doubleValue(for: .meter())
                let miles = meters * 0.000621371 // Convert meters to miles
                print("(HKM) Distance from HealthKit: \(String(format: "%.2f", miles)) mi ✅")
                completion(miles, nil)
            }
        }
        
        healthStore.execute(query)
    }
    
    // MARK: - 7-Day Average

    /// Fetches the average number of steps taken over the past 7 days.
    ///
    /// - Parameter completion: Completion handler with average step count or error.
    func fetchSevenDayStepAverage(completion: @escaping (Double?, Error?) -> Void) {
        let calendar = Calendar.current
        // Use the last 7 FULL days, excluding today, to avoid partial-day bias.
        let startOfToday = calendar.startOfDay(for: Date())
        guard let startDate = calendar.date(byAdding: .day, value: -7, to: startOfToday) else {
            let error = NSError(domain: "HealthKitError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid start date"])
            completion(nil, error)
            return
        }

        let predicate = HKQuery.predicateForSamples(
            withStart: startDate,
            end: startOfToday,
            options: .strictStartDate
        )

        let query = HKStatisticsQuery(
            quantityType: stepCountType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum
        ) { _, result, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ (HKM) Error fetching 7-day step data: \(error.localizedDescription)")
                    completion(nil, error)
                    return
                }

                guard let quantity = result?.sumQuantity() else {
                    print("❌ (HKM) No step data for last 7 full days.")
                    completion(0, nil)
                    return
                }

                let totalSteps = quantity.doubleValue(for: .count())
                let average = totalSteps / 7.0
                let rounded = Int(average.rounded())
                print("(HKM) 7-Day Step Average (last 7 full days): \(rounded) (raw: \(average)) ✅")
                completion(average, nil)
            }
        }

        healthStore.execute(query)
    }
    
    /// Fetches daily step counts from the start of the current year to today.
    ///
    /// - Parameter completion: A dictionary of [Date String: Step Count] or an error.
    func fetchStepHistory(completion: @escaping ([String: Int]?, Error?) -> Void) {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        // Start from January 1st of the current year
        guard let startOfYear = calendar.date(from: calendar.dateComponents([.year], from: today)) else {
            let error = NSError(domain: "HealthKitError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get start of year"])
            completion(nil, error)
            return
        }
        
        let endDate = today.addingTimeInterval(86399) // Include full day until current time
        
        let predicate = HKQuery.predicateForSamples(
            withStart: startOfYear,
            end: endDate,
            options: .strictStartDate
        )
        
        print("📅 Fetching Year-to-Date Step History from \(startOfYear) to \(endDate)")
        
        let query = HKStatisticsCollectionQuery(
            quantityType: stepCountType,
            quantitySamplePredicate: predicate,
            options: .cumulativeSum,
            anchorDate: today, // Anchor can be today for daily intervals
            intervalComponents: DateComponents(day: 1)
        )
        
        query.initialResultsHandler = { _, results, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ (HKM) Error fetching step history YTD: \(error.localizedDescription)")
                    completion(nil, error)
                    return
                }
                
                var stepHistory: [String: Int] = [:]
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "M/d/yy"
                
                results?.enumerateStatistics(from: startOfYear, to: endDate) { stat, _ in
                    let steps = stat.sumQuantity()?.doubleValue(for: .count()) ?? 0
                    let date = dateFormatter.string(from: stat.startDate)
                    stepHistory[date] = Int(steps)
                }
                
                print("(HKM) Year-to-Date Step History: \(stepHistory.count) days ✅")
                completion(stepHistory, nil)
            }
        }
        
        healthStore.execute(query)
    }
}

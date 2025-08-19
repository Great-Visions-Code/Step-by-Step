//
//  StepTrackerViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/19/24.
//

import SwiftUI

/// ViewModel for managing step tracking data and logic.
///
/// `StepTrackerViewModel` is the single source of truth for all step-related state used
/// across the app. It:
/// - Pulls live metrics from HealthKit (via `HealthKitViewModel`)
/// - Tracks the daily goal and progress
/// - Maintains a rolling step history for charts/achievements
/// - Calculates derived values such as current/longest streaks and best day
///
/// State updates are published via the `@Published` `stepTracker` value to drive SwiftUI UIs.
class StepTrackerViewModel: ObservableObject {

    // MARK: - Published State

    /// The model that stores user step data and history.
    ///
    /// Use `private(set)` to ensure external code cannot mutate the model directly.
    /// All writes should happen through ViewModel methods to keep behavior consistent.
    @Published private(set) var stepTracker: StepTracker

    // MARK: - Dependencies

    /// Bridges to HealthKit for live values (steps, distance, averages).
    private let healthKitViewModel = HealthKitViewModel()

    /// Evaluates milestones/achievements when history updates.
    private let achievementsViewModel = AchievementsViewModel()

    // MARK: - Derived Display Properties

    /// A formatted percentage representing how close the current step count is to the daily goal.
    ///
    /// - Returns: A percentage string (e.g., `"42.6%"`), capped at `5000%` as a sanity limit.
    var goalProgress: String {
        let stepsTaken = stepTracker.currentStepCount
        let goal = stepTracker.totalStepsGoal

        guard goal > 0 else { return "0%" } // Prevent division by zero
        let progress = (Double(stepsTaken) / Double(goal)) * 100
        return String(format: "%.1f%%", min(progress, 5000))
    }

    /// The highest step count found in the current `stepHistory`.
    ///
    /// - Note: Returns `0` if no history is present.
    var maxStepCount: Int {
        stepTracker.stepHistory.map { $0.steps }.max() ?? 0
    }

    /// A formatted date (e.g., `"Jul 18"`) for the best step day in `stepHistory`.
    ///
    /// If there is no history or the date cannot be parsed, returns `"-"`.
    var bestDayDateFormatted: String {
        // Formatter used to parse stored history dates from HealthKit bridge (e.g., "M/d/yy").
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "M/d/yy"

        // Desired output format for UI.
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMM d"

        guard let bestDayEntry = stepTracker.stepHistory.max(by: { $0.steps < $1.steps }),
              let date = inputFormatter.date(from: bestDayEntry.date) else {
            return "-"
        }
        return outputFormatter.string(from: date)
    }

    /// The longest streak of **consecutive** days where steps met or exceeded the daily goal.
    ///
    /// - Important: This is an **all-time max** based on the currently loaded `stepHistory`.
    /// - Note: `stepHistory` is expected to represent unique days; if duplicates exist,
    ///   behavior depends on their chronological order after sorting.
    var longestStepStreak: Int {
        let goal = stepTracker.totalStepsGoal
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d/yy"

        // Convert history into `(Date, steps)` and ensure chronological order.
        let sorted = stepTracker.stepHistory
            .compactMap { entry -> (Date, Int)? in
                guard let date = dateFormatter.date(from: entry.date) else { return nil }
                return (date, entry.steps)
            }
            .sorted(by: { $0.0 < $1.0 })

        var longest = 0
        var current = 0
        var previousDate: Date?

        for (date, steps) in sorted {
            if steps >= goal {
                // If yesterday was also a success and today is exactly 1 day later, extend streak.
                if let prev = previousDate,
                   Calendar.current.dateComponents([.day], from: prev, to: date).day == 1 {
                    current += 1
                } else {
                    // New streak starting at this date.
                    current = 1
                }
            } else {
                // Missed the goal → reset the running streak.
                current = 0
            }
            previousDate = date
            longest = max(longest, current)
        }

        return longest
    }

        /// The **current** streak of consecutive days meeting/exceeding the goal,
        /// ending at the most recent day that already met the goal.
        ///
        /// Examples:
        /// - If today hasn't hit the goal yet but yesterday did (and the day before too),
        ///   you'll still see a non-zero streak.
        /// - As soon as today crosses the goal, the streak will include today.
        var currentStepStreak: Int {
            let goal = stepTracker.totalStepsGoal
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M/d/yy"

            // Convert and sort ascending by date for deterministic ordering.
            let sorted: [(date: Date, steps: Int)] = stepTracker.stepHistory
                .compactMap { entry in
                    guard let d = dateFormatter.date(from: entry.date) else { return nil }
                    return (d, entry.steps)
                }
                .sorted { $0.date < $1.date }

            // Find the most-recent index that *meets or exceeds* the goal.
            guard let anchorIndex = sorted.indices.last(where: { sorted[$0].steps >= goal }) else {
                return 0 // No qualifying day at all → streak is 0
            }

            var streak = 1 // Start with the anchor day itself
            var prevDate = sorted[anchorIndex].date

            // Walk backwards from the day before the anchor, while days are consecutive and meet the goal.
            var i = anchorIndex - 1
            while i >= 0 {
                let (d, steps) = sorted[i]
                guard steps >= goal else { break }

                // Check that this day is exactly one day before the previous (more recent) day.
                let gap = Calendar.current.dateComponents([.day], from: d, to: prevDate).day ?? 0
                guard gap == 1 else { break }

                streak += 1
                prevDate = d
                i -= 1
            }

            return streak
        }

    // MARK: - Persistence Keys

    /// Storage keys for persisted values.
    private static let totalStepsTakenKey = "totalStepsTaken"
    private static let lastResetDateKey   = "lastResetDate"
    private static let totalStepsGoalKey  = "totalStepsGoal"

    // MARK: - Initialization

    /// Initializes the ViewModel with persisted goal/steps and primes HealthKit updates.
    ///
    /// - Note: This triggers async updates from `HealthKitViewModel` to populate
    ///   `currentStepCount`, `currentDistance`, the 7-day average, and the step history.
    init() {
        // Load saved goal (fallback to 5,000 if never set).
        let savedTotalStepsGoal = UserDefaults.standard.integer(forKey: Self.totalStepsGoalKey)
        let finalTotalStepsGoal = savedTotalStepsGoal > 0 ? savedTotalStepsGoal : 5000

        // Load persisted lifetime steps (app-specific accumulation).
        let savedTotalStepsTaken = StepTrackerViewModel.loadTotalStepsTaken()

        // Seed the model; live values below will override as HealthKit updates arrive.
        self.stepTracker = StepTracker(
            currentStepCount: 0,
            totalStepsGoal: finalTotalStepsGoal,
            currentDistance: 0.0,
            totalStepsTaken: savedTotalStepsTaken
        )

        // Midnight reset (daily accumulation), then kick off data refreshes.
        checkAndResetStepsAtMidnight()
        updateCurrentStepCount()
        updateCurrentDistance()
        updateSevenDayStepAverage()
        updateStepHistory()
    }

    // MARK: - Live Value Updates (HealthKit Bridges)

    /// Refreshes `currentStepCount` from HealthKit and publishes it to the model.
    ///
    /// - Important: Assignment is dispatched to the main thread for UI safety.
    func updateCurrentStepCount() {
        healthKitViewModel.updateStepCount()
        DispatchQueue.main.async { [weak self] in
            self?.stepTracker.currentStepCount = self?.healthKitViewModel.hkCurrentStepsCount ?? 0
        }
    }

    /// Refreshes `currentDistance` from HealthKit and publishes it to the model.
    func updateCurrentDistance() {
        healthKitViewModel.updateDistance()
        DispatchQueue.main.async { [weak self] in
            self?.stepTracker.currentDistance = self?.healthKitViewModel.hkCurrentDistance ?? 0
        }
    }

    /// Refreshes the 7‑day average from HealthKit and publishes it to the model.
    func updateSevenDayStepAverage() {
        healthKitViewModel.updateSevenDayStepAverage()
        DispatchQueue.main.async { [weak self] in
            self?.stepTracker.sevenDayStepAverage = self?.healthKitViewModel.hkSevenDayStepAverage ?? 0
        }
    }

    /// Refreshes `stepHistory` from `HealthKitManager`, sorts it, and notifies achievements.
    ///
    /// - Note: Dates are expected to arrive as `"M/d/yy"`. We parse to `Date` to sort chronologically,
    ///   then store the original string back for display to avoid reformatting cost elsewhere.
    func updateStepHistory() {
        HealthKitManager.shared.fetchStepHistory { [weak self] stepData, error in
            DispatchQueue.main.async {
                guard let self = self else { return }

                if let stepData = stepData {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "M/d/yy"

                    // Convert to `(Date, "M/d/yy", steps)` while discarding entries with bad dates.
                    let dateStepArray: [(date: Date, formattedDate: String, steps: Int)] = stepData.compactMap { dateString, steps in
                        guard let date = dateFormatter.date(from: dateString) else {
                            print("⚠️ (STVM) Failed to parse date: \(dateString)")
                            return nil
                        }
                        return (date, dateString, steps)
                    }

                    // Sort by actual date value to ensure accurate chronological order.
                    let sortedDateStepArray = dateStepArray.sorted { $0.date < $1.date }

                    // Keep the original string for lightweight UI usage.
                    let sortedData = sortedDateStepArray.map { (date: $0.formattedDate, steps: $0.steps) }

                    self.stepTracker.stepHistory = sortedData
                    print("(STVM) Correctly Sorted Step History: \(sortedData) ✅")

                    // Let Achievements know the latest data set.
                    self.achievementsViewModel.evaluateAllStepMilestones(from: sortedData)
                } else {
                    print("❌ (STVM) Failed to fetch step history: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
    }

    /// Convenience accessor for already-sorted step history.
    ///
    /// - Returns: An array of tuples `(date: String, steps: Int)` in chronological order.
    func sortedStepData() -> [(date: String, steps: Int)] {
        stepTracker.stepHistory
    }

    // MARK: - Event/Mutation Helpers

    /// Updates the current step count directly (e.g., when a live HealthKit stream pushes a delta).
    ///
    /// - Parameter newStepCount: Fresh step count to apply to the model.
    func updateCurrentSteps(to newStepCount: Int) {
        stepTracker.currentStepCount = newStepCount
        print("(STVM) StepTrackerViewModel updated step count (newStepCount): \(newStepCount) ✅")
    }

    /// Converts pending steps into energy and updates accumulated totals.
    ///
    /// This uses `ConvertToEnergyViewModel` to determine:
    /// - How many steps convert to energy *now*
    /// - How many remain to roll over
    ///
    /// Converted steps are added into `totalStepsTaken` and persisted.
    ///
    /// - Parameter updateEnergy: Closure to push awarded energy into `PlayerStatsViewModel`.
    ///   (Callers typically pass a method reference.)
    func commitStepsToTotal(updateEnergy: (Int) -> Void) {
        let (energyPoints, remainingSteps) = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTracker.stepsToConvert,
            totalStepsGoal: stepTracker.totalStepsGoal
        )

        // Increase lifetime total by *only* the converted portion (drop the remainder).
        stepTracker.totalStepsTaken += (stepTracker.stepsToConvert - remainingSteps)

        // Persist lifetime steps for continuity across launches.
        StepTrackerViewModel.saveTotalStepsTaken(stepTracker.totalStepsTaken)

        print("(STVM) Energy Added: \(energyPoints) ⚡️ | Remaining Steps: \(remainingSteps) 🚶‍♂️")
        // Note: `updateEnergy` is invoked by the caller; we leave energy wiring to that layer.
    }

    // MARK: - Daily Reset

    /// Resets the daily accumulation at midnight, recorded by a `lastResetDate` flag.
    ///
    /// - Note: This resets **`totalStepsTaken`** (your app’s cumulative counter),
    ///   not HealthKit’s history. Adjust if you intend a different reset policy.
    private func checkAndResetStepsAtMidnight() {
        let lastResetDate = UserDefaults.standard.object(forKey: Self.lastResetDateKey) as? Date ?? .distantPast
        let calendar = Calendar.current

        // If we don't have a reset recorded for today, clear and store now.
        if !calendar.isDate(lastResetDate, inSameDayAs: Date()) {
            stepTracker.totalStepsTaken = 0
            StepTrackerViewModel.saveTotalStepsTaken(0)
            UserDefaults.standard.set(Date(), forKey: Self.lastResetDateKey)
            print("Total steps reset at midnight")
        }
    }

    // MARK: - Persistence

    /// Persists the app’s lifetime total steps value.
    ///
    /// - Parameter totalSteps: New lifetime total to store.
    static func saveTotalStepsTaken(_ totalSteps: Int) {
        UserDefaults.standard.set(totalSteps, forKey: totalStepsTakenKey)
    }

    /// Loads the persisted lifetime total steps value.
    ///
    /// - Returns: The saved value, or `0` if none exists.
    static func loadTotalStepsTaken() -> Int {
        UserDefaults.standard.integer(forKey: totalStepsTakenKey)
    }

    /// Updates the user’s daily step goal and persists it.
    ///
    /// - Parameter newGoal: New daily goal (steps).
    ///
    /// - Note: This recreates the `StepTracker` value to ensure the
    ///   struct’s `let`/`var` semantics are respected for SwiftUI updates.
    func updateTotalStepsGoal(to newGoal: Int) {
        stepTracker = StepTracker(
            currentStepCount: stepTracker.currentStepCount,
            totalStepsGoal: newGoal,
            currentDistance: stepTracker.currentDistance,
            totalStepsTaken: stepTracker.totalStepsTaken
        )

        UserDefaults.standard.set(newGoal, forKey: Self.totalStepsGoalKey)
        print("(STVM) Updated Step Goal: \(newGoal) Steps 🎯")
    }

    /// Calculates how many energy points can be awarded from the current `stepsToConvert`.
    ///
    /// - Returns: Energy points (uncapped here; caller may cap if desired in UI).
    func calculateEnergyPoints() -> Int {
        let (energyPoints, _) = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTracker.stepsToConvert,
            totalStepsGoal: stepTracker.totalStepsGoal
        )
        return energyPoints
    }

    // MARK: - Testing / Debug Utilities

    /// Overwrites the lifetime total steps (for previews/testing).
    ///
    /// - Parameter steps: New lifetime total to display.
    func setTotalStepsTaken(_ steps: Int) {
        stepTracker = StepTracker(
            currentStepCount: stepTracker.currentStepCount,
            totalStepsGoal: stepTracker.totalStepsGoal,
            currentDistance: stepTracker.currentDistance,
            totalStepsTaken: steps
        )
    }
}

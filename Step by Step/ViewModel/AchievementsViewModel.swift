//
//  AchievementsViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/20/24.
//

import SwiftUI

/// ViewModel responsible for managing the achievements data in the app.
///
/// This ViewModel provides functionality to observe and modify user achievements,
/// such as tracking the number of attempts made in the game, unlocking achievements, and ensuring persistence.
class AchievementsViewModel: ObservableObject {
    /// Published property for `Achievements`, allowing views to react to updates.
    /// This ensures UI components stay in sync with the achievements data.
    @Published private(set) var achievements: Achievements {
        didSet {
            saveAchievements()
        }
    }
    
    /// UserDefaults key for storing data persistently.
    private let attemptsKey = "userAttempts"
    private let stepsInADayKey = "stepsInADayUnlocked"
    private let totalStepsKey = "totalStepsUnlocked"
    private let totalDistanceKey = "totalDistanceUnlocked"
    
    let stepsInADayMilestones: [Int] = [5_000, 10_000, 12_500, 15_000, 20_000, 30_000, 50_000]
    let totalStepsMilestones: [Int] = [10_000, 25_000, 50_000, 100_000, 250_000, 500_000, 1_000_000, 3_000_000, 5_000_000]
    let totalDistanceMilestones: [Double] = [1, 3, 5, 10, 15, 25, 50, 100, 200, 500, 1000, 2500, 5000, 10_000, 15_000, 25_000, 50_000]
    
    /// Initializes the ViewModel.
    init() {
        let attempts = UserDefaults.standard.integer(forKey: attemptsKey)
        let day = Set(UserDefaults.standard.array(forKey: stepsInADayKey) as? [Int] ?? [])
        let total = Set(UserDefaults.standard.array(forKey: totalStepsKey) as? [Int] ?? [])
        let distance = Set(UserDefaults.standard.array(forKey: totalDistanceKey) as? [Double] ?? [])
        
        self.achievements = Achievements(
            attempts: attempts,
            stepsInADayAchievementUnlocked: day,
            totalStepsAchievementUnlocked: total,
            totalDistanceAchievementUnlocked: distance
        )
    }
    
    /// Increments the number of attempts by one and saves to UserDefaults.
    ///
    /// This method is typically called when the user starts a new attempt in the story.
    func incrementAttempts() {
        achievements.attempts += 1
    }
    
    /// Resets the number of attempts to zero.
    ///
    /// This method can be used when the user wants to clear their progress or reset their achievements.
    func resetAttempts() {
        achievements.attempts = 0
    }
    
    // MARK: - Unlock Checkers

    func evaluateAllStepMilestones(from stepData: [(date: String, steps: Int)]) {
        let maxInADay = stepData.map { $0.steps }.max() ?? 0
        let totalSteps = stepData.reduce(0) { $0 + $1.steps }
        let totalDistanceMiles = Double(totalSteps) * 0.0005 // Assuming 2000 steps ≈ 1 mile

        unlockMaxStepsInADayIfNeeded(currentMax: maxInADay)
        unlockTotalStepsIfNeeded(total: totalSteps)
        unlockTotalDistanceIfNeeded(distance: totalDistanceMiles)
    }

    private func unlockMaxStepsInADayIfNeeded(currentMax: Int) {
        for milestone in stepsInADayMilestones where currentMax >= milestone && !achievements.stepsInADayAchievementUnlocked.contains(milestone) {
            achievements.stepsInADayAchievementUnlocked.insert(milestone)
        }
    }
    
    
    private func unlockTotalStepsIfNeeded(total: Int) {
        for milestone in totalStepsMilestones where total >= milestone && !achievements.totalStepsAchievementUnlocked.contains(milestone) {
            achievements.totalStepsAchievementUnlocked.insert(milestone)
        }
    }

    private func unlockTotalDistanceIfNeeded(distance: Double) {
        for milestone in totalDistanceMilestones where distance >= milestone && !achievements.totalDistanceAchievementUnlocked.contains(milestone) {
            achievements.totalDistanceAchievementUnlocked.insert(milestone)
        }
    }
    
    // MARK: - Reset Functions

    func resetMaxStepsInADayAchievements() {
        achievements.stepsInADayAchievementUnlocked = []
    }

    func resetTotalStepsAchievements() {
        achievements.totalStepsAchievementUnlocked = []
    }

    func resetTotalDistanceAchievements() {
        achievements.totalDistanceAchievementUnlocked = []
    }

    // MARK: - Persistence

    private func saveAchievements() {
        UserDefaults.standard.set(achievements.attempts, forKey: attemptsKey)
        UserDefaults.standard.set(Array(achievements.stepsInADayAchievementUnlocked), forKey: stepsInADayKey)
        UserDefaults.standard.set(Array(achievements.totalStepsAchievementUnlocked), forKey: totalStepsKey)
        UserDefaults.standard.set(Array(achievements.totalDistanceAchievementUnlocked), forKey: totalDistanceKey)
    }
}

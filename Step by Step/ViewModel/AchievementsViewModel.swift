//
//  AchievementsViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/20/24.
//

import SwiftUI

/// ViewModel responsible for managing and persisting achievement progress.
///
/// Handles logic for unlocking milestones, tracking step totals, resetting progress, and
/// generating display-ready achievement data for views like `AchievementsView` and `StoryAchievementsView`.
class AchievementsViewModel: ObservableObject {
    // MARK: - Published Properties

    /// The underlying achievements model, updated and observed by the UI.
    @Published private(set) var achievements: Achievements {
        didSet {
            saveAchievements()
        }
    }
    
    // MARK: - UserDefaults Keys
    
    private let attemptsKey = "userAttempts"
    private let stepsInADayKey = "stepsInADayAchievementUnlocked"
    private let totalStepsKey = "totalStepsAchievementUnlocked"
    private let totalDistanceKey = "totalDistanceAchievementUnlocked"
    private let storyDaysKey = "storyDaysCompletedAchievementUnlocked"
    
    // MARK: - Milestone Definitions
    
    let stepsInADayMilestones: [Int] = [
        5_000,
        7_500,
        10_000,
        12_500,
        15_000,
        17_500,
        20_000,
        25_000,
        30_000,
        35_000,
        40_000
    ]
    let totalStepsMilestones: [Int] = [
        50_000,
        75_000,
        100_000,
        250_000,
        500_000,
        1_000_000,
        2_500_000,
        5_000_000,
        10_000_000
    ]
    let totalDistanceMilestones: [Double] = [
        50,
        75,
        100,
        250,
        500,
        750,
        1_000,
        2_500,
        5_000,
        10_000
    ]
    
    /// Maps in-game day to the minimum chapterID required to unlock it.

    let surviveStoryDayMilestones: [Int: Int] = [
        1: 21, // Survive Day 1 Achievement (Chap 2 beginning)
        2: 31, // Survive Day 2 Achievement(Chap 3 beginning)
        3: 41, // Survive Day 3 Achievement(Chap 4 beginning)
        4: 51, // Survive Day 4 Achievement(Chap 5 beginning)
        5: 56 // Survive Day 5 Achievement(Chap 5 ending)
    ]
    
    // MARK: - Initialization
    
    init() {
        let attempts = UserDefaults.standard.integer(forKey: attemptsKey)
        let day = Set(UserDefaults.standard.array(forKey: stepsInADayKey) as? [Int] ?? [])
        let total = Set(UserDefaults.standard.array(forKey: totalStepsKey) as? [Int] ?? [])
        let distance = Set(UserDefaults.standard.array(forKey: totalDistanceKey) as? [Double] ?? [])
        let story = Set(UserDefaults.standard.array(forKey: storyDaysKey) as? [Int] ?? [])
        
        self.achievements = Achievements(
            attempts: attempts,
            stepsInADayAchievementUnlocked: day,
            totalStepsAchievementUnlocked: total,
            totalDistanceAchievementUnlocked: distance,
            storyDaysCompletedAchievementUnlocked: story
        )
    }
    
    // MARK: - Attempts

    /// Increments the user's attempt counter and persists the change.
    func incrementAttempts() {
        achievements.attempts += 1
    }

    /// Resets the user's attempt counter to 0.
    func resetAttempts() {
        achievements.attempts = 0
    }
    
    // MARK: - Story Progress

    /// Evaluates whether story-day achievements should be unlocked based on current chapter progress.
    func evaluateStoryProgress(chapterID: Int) {
        for (day, requiredChapterID) in surviveStoryDayMilestones {
            if chapterID >= requiredChapterID && !achievements.storyDaysCompletedAchievementUnlocked.contains(day) {
                achievements.storyDaysCompletedAchievementUnlocked.insert(day)
            }
        }
    }

    /// Checks if a specific story day achievement has been unlocked.
    func isStoryDayAchievementUnlocked(_ day: Int) -> Bool {
        achievements.storyDaysCompletedAchievementUnlocked.contains(day)
    }
    
    // MARK: - Step & Distance Evaluation
    
    /// Evaluates step-related achievements across all categories based on step history.
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
    
    // MARK: - Display Generators

    /// Returns display-ready data for "Steps In A Day" achievements.
    func stepsInADayDisplayItems(currentSteps: Int, stepHistory: [(date: String, steps: Int)]) -> [AchievementCardItems] {
            return stepsInADayMilestones.map { milestone in
                let isUnlocked = achievements.stepsInADayAchievementUnlocked.contains(milestone)
                let date = stepHistory.first(where: { $0.steps >= milestone })?.date
                let stepsToGo = max(milestone - currentSteps, 0)
                let note = isUnlocked ? nil : "Steps to go: \(stepsToGo.formatted())"

                return AchievementCardItems(
                    title: "\(milestone.formatted()) Steps",
                    description: "Walk \(milestone.formatted()) steps in a single day",
                    isCompleted: isUnlocked,
                    dateEarned: isUnlocked ? date : nil,
                    progressNote: note
                )
            }
        }
    
    /// Returns display-ready data for "Total Steps Taken" achievements.
    func totalStepsDisplayItems(stepHistory: [(date: String, steps: Int)]) -> [AchievementCardItems] {
        var displayItems: [AchievementCardItems] = []
        var runningTotal = 0
        var dateByMilestone: [Int: String] = [:]
        
        for (date, steps) in stepHistory {
            runningTotal += steps
            
            for milestone in totalStepsMilestones where runningTotal >= milestone && dateByMilestone[milestone] == nil {
                dateByMilestone[milestone] = date
            }
        }

        for milestone in totalStepsMilestones {
            let isUnlocked = achievements.totalStepsAchievementUnlocked.contains(milestone)
            let stepsToGo = max(milestone - runningTotal, 0)
            let note = isUnlocked ? nil : "Steps to go: \(stepsToGo.formatted())"
            
            displayItems.append(
                AchievementCardItems(
                    title: "\(milestone.formatted()) Steps",
                    description: "Walk \(milestone.formatted()) steps total",
                    isCompleted: isUnlocked,
                    dateEarned: dateByMilestone[milestone],
                    progressNote: note
                )
            )
        }
        
        return displayItems
    }
    
    /// Returns display-ready data for "Total Distance Traveled" achievements.
    func totalDistanceDisplayItems(stepHistory: [(date: String, steps: Int)]) -> [AchievementCardItems] {
        var displayItems: [AchievementCardItems] = []
        var runningTotalSteps = 0
        var runningDistance = 0.0
        var dateByMilestone: [Double: String] = [:]

        for (date, steps) in stepHistory {
            runningTotalSteps += steps
            runningDistance = Double(runningTotalSteps) * 0.0005

            for milestone in totalDistanceMilestones where runningDistance >= milestone && dateByMilestone[milestone] == nil {
                dateByMilestone[milestone] = date
            }
        }

        for milestone in totalDistanceMilestones {
            let isUnlocked = achievements.totalDistanceAchievementUnlocked.contains(milestone)
            let milesToGo = max(milestone - runningDistance, 0)
            let note = isUnlocked ? nil : "Miles to go: \(milesToGo.formattedWithCommas())"

            displayItems.append(
                AchievementCardItems(
                    title: "\(milestone.formattedWithCommas()) Miles",
                    description: "Travel \(milestone.formattedWithCommas()) miles total",
                    isCompleted: isUnlocked,
                    dateEarned: dateByMilestone[milestone],
                    progressNote: note
                )
            )
        }

        return displayItems
    }

    // MARK: - Reset Functions

    /// Resets all 'Steps In A Day' achievements.
    func resetMaxStepsInADayAchievements() {
        achievements.stepsInADayAchievementUnlocked = []
    }

    /// Resets all 'Total Steps Taken' achievements.
    func resetTotalStepsAchievements() {
        achievements.totalStepsAchievementUnlocked = []
    }

    /// Resets all 'Total Distance Traveled' achievements.
    func resetTotalDistanceAchievements() {
        achievements.totalDistanceAchievementUnlocked = []
    }

    // MARK: - Persistence

    /// Saves the current state of all achievements to `UserDefaults`.
    private func saveAchievements() {
        UserDefaults.standard.set(achievements.attempts, forKey: attemptsKey)
        UserDefaults.standard.set(Array(achievements.stepsInADayAchievementUnlocked), forKey: stepsInADayKey)
        UserDefaults.standard.set(Array(achievements.totalStepsAchievementUnlocked), forKey: totalStepsKey)
        UserDefaults.standard.set(Array(achievements.totalDistanceAchievementUnlocked), forKey: totalDistanceKey)
        UserDefaults.standard.set(Array(achievements.storyDaysCompletedAchievementUnlocked), forKey: storyDaysKey)
    }
}

//
//  Achievements.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/20/24.
//

import Foundation

/// A model that encapsulates all user achievements within the app.
///
/// The `Achievements` structure tracks the user's milestone progress across multiple categories,
/// including gameplay attempts, step-based goals, distance traveled, and story progression.
struct Achievements: Codable {
    
    /// The total number of times the user has attempted or restarted a story.
    ///
    /// This value increments each time a user resets their progress or starts over.
    var attempts: Int

    /// A set of milestone thresholds (in steps) achieved within a single day.
    ///
    /// Used to track and unlock daily walking achievements such as walking 5,000 or 10,000 steps in one day.
    /// Example values: `5_000`, `10_000`, `15_000`.
    var stepsInADayAchievementUnlocked: Set<Int>
    
    /// A set of cumulative step count milestones achieved by the user.
    ///
    /// Tracks the total number of steps taken across all days and sessions.
    /// Example values: `50_000`, `100_000`, `1_000_000`.
    var totalStepsAchievementUnlocked: Set<Int>
    
    /// A set of cumulative distance milestones (in miles) achieved by the user.
    ///
    /// Distance is calculated from total step count (e.g., 2000 steps ≈ 1 mile).
    /// Example values: `1.0`, `5.0`, `10.0`, `100.0`.
    var totalDistanceAchievementUnlocked: Set<Double>
    
    /// A set of story day milestones that have been completed.
    ///
    /// Each milestone corresponds to a key chapterID that represents a completed in-game day.
    /// Example values: `1` (Day 1), `2` (Day 2), etc.
    var storyDaysCompletedAchievementUnlocked: Set<Int>
}

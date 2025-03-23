//
//  Achievements.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/20/24.
//

import Foundation

/// A model representing user achievements in the app.
///
/// This struct encapsulates the progress and milestones users achieve
/// during their gameplay, such as the number of attempts taken in stories.
struct Achievements {
    /// The number of attempts made by the user across stories.
    ///
    /// - Parameter attempts: Tracks how many times the user has restarted or tried a story.
    var attempts: Int
    
    var stepsInADayAchievementUnlocked: Set<Int>
    var totalStepsAchievementUnlocked: Set<Int>
    var totalDistanceAchievementUnlocked: Set<Double>
}

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
/// such as tracking the number of attempts made in the game.
class AchievementsViewModel: ObservableObject {
    /// Published property for `Achievements`, allowing views to react to updates.
    /// This ensures UI components stay in sync with the achievements data.
    @Published private(set) var achievements: Achievements
    
    /// Initializes the ViewModel with default or custom achievements data.
    /// - Parameter attempts: The initial number of attempts, with a default value of 0.
    init(attempts: Int = 0) {
        self.achievements = Achievements(attempts: attempts)
    }
    
    /// Increments the number of attempts by one.
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
}

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
/// such as tracking the number of attempts made in the game and ensuring persistence.
class AchievementsViewModel: ObservableObject {
    /// Published property for `Achievements`, allowing views to react to updates.
    /// This ensures UI components stay in sync with the achievements data.
    @Published private(set) var achievements: Achievements {
        didSet {
            saveAttempts() // Save whenever attempts change
        }
    }
    
    /// UserDefaults key for storing attempts persistently.
    private let attemptsKey = "userAttempts"
    
    /// Initializes the ViewModel by loading saved attempt data or defaulting to 0.
    init() {
        let savedAttempts = UserDefaults.standard.integer(forKey: attemptsKey)
        self.achievements = Achievements(attempts: savedAttempts)
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
    
    /// Saves the current attempts count to UserDefaults for persistence.
    private func saveAttempts() {
        UserDefaults.standard.set(achievements.attempts, forKey: attemptsKey)
    }
}

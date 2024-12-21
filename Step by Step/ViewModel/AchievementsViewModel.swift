//
//  AchievementsViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/20/24.
//

import SwiftUI

/// ViewModel for managing achievements data.
class AchievementsViewModel: ObservableObject {
    /// Published achievements data, allowing views to observe changes.
    @Published private(set) var achievements: Achievements
    
    /// Initializes the ViewModel with default or custom values.
    /// - Parameter attempts: The initial number of attempts (default  is 0).
    init(attempts: Int = 0) {
        self.achievements = Achievements(attempts: attempts)
    }
    
    /// Increments the number of attempts by one.
    func incrementAttempts() {
        achievements.attempts += 1
    }
    
    /// Resets the number of attempts to zero.
    func resetAttempts() {
        achievements.attempts = 0
    }
}

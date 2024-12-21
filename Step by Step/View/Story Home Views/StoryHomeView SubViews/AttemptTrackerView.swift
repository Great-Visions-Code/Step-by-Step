//
//  AttemptTrackerView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// Displays the current attempt number for the player's story.
/// Useful for tracking how many times a player has started or restarted a story.
struct AttemptTrackerView: View {
    /// The ViewModel managing the achievements, including attempt tracking.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    
    var body: some View {
        // Display the attempt number from the ViewModel.
        Text("Attempt #\(achievementsViewModel.achievements.attempts)")
            .font(.title2)
            .fontWeight(.bold)
    }
}

#Preview {
    AttemptTrackerView(
        achievementsViewModel: AchievementsViewModel()
    )
}

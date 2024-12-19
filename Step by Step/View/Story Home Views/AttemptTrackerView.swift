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
    /// The current attempt number, defaulting to 0.
    var newStoryAttempt: Int = 0
    
    var body: some View {
        // Display the attempt number prominently.
        Text("Attempt #\(newStoryAttempt)")
            .font(.title2)
            .fontWeight(.bold)
    }
}

#Preview {
    AttemptTrackerView(
        newStoryAttempt: 3
    )
}

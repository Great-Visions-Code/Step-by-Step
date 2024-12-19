//
//  CurrentStepsTakenProgressView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

/// Displays the user's current steps progress toward their daily goal.
///
/// This view is intended to provide visual feedback on the user's progress,
/// encouraging them to stay active and reach their step goal for the day.
/// Future enhancements will include a circular progress bar.
struct CurrentStepsTakenProgressView: View {
    /// The number of steps the user has taken so far.
    var currentStepsTaken: Int
    /// The user's total daily step goal.
    var totalStepsGoal: Int
    
    var body: some View {
        VStack {
            // Displays a title indicating the section's purpose.
            Text("Steps Taken:")
                .font(.title)
                .bold()
                .padding(.bottom, 2)
            
            // Placeholder text showing the current steps taken versus the total goal.
            // To be replaced with a circular progress bar.
            Text("\(currentStepsTaken) out of a goal of \(totalStepsGoal)")
                .font(.headline)
                .padding(.bottom)
        }
    }
}

#Preview {
    CurrentStepsTakenProgressView(
        currentStepsTaken: 5000,
        totalStepsGoal: 10000
    )
}

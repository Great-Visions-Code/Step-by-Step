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
    /// The ViewModel for managing step tracking data and logic.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    var body: some View {
        VStack {
            // Displays a title indicating the section's purpose.
            Text("Steps Taken:")
                .font(.title)
                .bold()
                .padding(.bottom, 2)
            
            // Placeholder text showing the current steps taken versus the total goal.
            // To be replaced with a circular progress bar.
            Text("\(stepTrackerViewModel.stepTracker.currentStepsTaken) out of a goal of \(stepTrackerViewModel.stepTracker.totalStepsGoals)")
                .font(.headline)
                .padding(.bottom)
        }
    }
}

#Preview {
    let stepTrackerViewModel = StepTrackerViewModel()
    
    CurrentStepsTakenProgressView(
        stepTrackerViewModel: stepTrackerViewModel
    )
}

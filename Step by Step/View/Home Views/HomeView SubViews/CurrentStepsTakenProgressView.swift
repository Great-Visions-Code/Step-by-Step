//
//  CurrentStepsTakenProgressView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

/// Displays the user's current steps progress toward their daily goal.
///
/// This view provides real-time feedback on the player's step count and progress toward a daily step goal.
/// The progress is visualized using a circular progress bar that updates dynamically.
/// Future enhancements may include animations and color customizations.
struct CurrentStepsTakenProgressView: View {
    /// The ViewModel for managing step tracking data.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    var body: some View {
        /// Calculates progress as a percentage of steps taken versus the total goal.
        /// Ensures the value remains within a valid range (0.0 - 1.0).
        let progress = min(Double(stepTrackerViewModel.stepTracker.totalStepsTaken) /
                           Double(stepTrackerViewModel.stepTracker.totalStepsGoal), 1.0)
        
        ZStack {
            // Background Circle (Unfilled)
            Circle()
                .stroke(lineWidth: 15)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            // Progress Circle
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .foregroundColor(.blue)
                .animation(.easeInOut(duration: 0.6), value: stepTrackerViewModel.stepTracker.totalStepsTaken)
            
            // Icon, Step Count, Goal
            VStack {
                Image(systemName: "figure.walk.motion")
                    .font(.system(size: 30))
                
                Text("\(stepTrackerViewModel.stepTracker.totalStepsTaken)")
                    .font(.largeTitle)
                    .bold()
                
                Text("Steps So Far")
                    .font(.title2)
                
                Text("Keep moving to earn more energy!")
                    .font(.caption2)
                
                Text("Goal: \(stepTrackerViewModel.stepTracker.totalStepsGoal) Steps")
                    .font(.subheadline)
                    .bold()
                    .padding(.top, 5)
            }
        }
        .frame(width: 240, height: 240)
        .padding()
    }
}

#Preview {
    let stepTrackerViewModel = StepTrackerViewModel()
    
    stepTrackerViewModel.setTotalStepsTaken(500)

    return CurrentStepsTakenProgressView(stepTrackerViewModel: stepTrackerViewModel)
}

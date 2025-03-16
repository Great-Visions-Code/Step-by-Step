//
//  StepsTakenStatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

struct StepsTakenStatsView: View {
    /// Observed ViewModel to track step count dynamically
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    @Environment(\.colorScheme) var colorScheme // Detect system theme
    
    /// Computed Property for Total Step Goal Progress
    private var goalProgress: String {
        let stepsTaken = stepTrackerViewModel.stepTracker.totalStepsTaken
        let goal = stepTrackerViewModel.stepTracker.totalStepsGoal
        
        guard goal > 0 else { return "0%"} // Prevent division by zero
        
        let progress = (Double(stepsTaken) / Double(goal)) * 100
        return String(format: "%.1f%%", min(progress, 500)) // Cap at 500%
    }

    var body: some View {
        // MARK: - Steps & 7-Day Average
        VStack(spacing: 8) {
            Text("STEPS")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("\(stepTrackerViewModel.stepTracker.currentStepCount)")
                .font(.system(size: 50, weight: .bold))

            
            HStack {
                Text("7-DAY AVERAGE")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text("2,942")
                    .font(.subheadline)
                    .bold()
            }
            .padding(.top, 4)
        }
        .padding()
        .onAppear {
            stepTrackerViewModel.updateCurrentStepCount()
        }
        
        // MARK: - Distance & Goal Progress
        HStack(spacing: 16) {
            StepsCardStatsView(title: "DISTANCE", value: "0.1 mi", colorScheme: colorScheme)
            StepsCardStatsView(title: "GOAL PROGRESS", value: goalProgress, colorScheme: colorScheme)
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    StepsTakenStatsView(
        stepTrackerViewModel: StepTrackerViewModel()
    )
}

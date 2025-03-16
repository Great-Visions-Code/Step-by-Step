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
            stepTrackerViewModel.updateCurrentDistance()
        }
        
        // MARK: - Distance & Goal Progress
        HStack(spacing: 16) {
            StepsCardStatsView(
                title: "DISTANCE",
                value: "\(String(format: "%.2f", stepTrackerViewModel.stepTracker.currentDistance)) mi",
                colorScheme: colorScheme
            )
            StepsCardStatsView(
                title: "GOAL PROGRESS",
                value: stepTrackerViewModel.goalProgress,
                colorScheme: colorScheme
            )
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    StepsTakenStatsView(
        stepTrackerViewModel: StepTrackerViewModel()
    )
}

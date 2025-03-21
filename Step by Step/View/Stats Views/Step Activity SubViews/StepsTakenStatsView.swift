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
                .font(.callout)
                .foregroundColor(.gray)
            
            Text("\(stepTrackerViewModel.stepTracker.currentStepCount)")
                .font(.system(size: 50, weight: .bold))

            
            HStack {
                Text("7-DAY AVERAGE")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                Text("\(Int(stepTrackerViewModel.stepTracker.sevenDayStepAverage))")
                    .font(.body)
                    .bold()
            }
            .padding(.top, 4)
        }
        .padding()
        .onAppear {
            stepTrackerViewModel.updateCurrentStepCount()
            stepTrackerViewModel.updateCurrentDistance()
            stepTrackerViewModel.updateSevenDayStepAverage()
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
        .padding()
    }
}

#Preview {
    StepsTakenStatsView(
        stepTrackerViewModel: StepTrackerViewModel()
    )
}

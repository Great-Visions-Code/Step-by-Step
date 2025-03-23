//
//  StepGoalEditorView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/2/25.
//

import SwiftUI

/// A modal that allows users to adjust their daily step goal.
struct StepGoalEditorView: View {
    /// ViewModel responsible for step tracking settings.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    /// Dismiss environment to close the modal.
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("Set Daily Step Goal")
                .font(.title)
                .bold()
            
            Text("\(stepTrackerViewModel.stepTracker.totalStepsGoal) Steps")
                .font(.title2)
                .bold()
                .padding(.bottom, 20)
            
            HStack(spacing: 30) {
                // Decrease Step Goal Button
                Button(action: {
                    let newGoal = max(stepTrackerViewModel.stepTracker.totalStepsGoal - 250, 1000) // Min 1000
                    stepTrackerViewModel.updateTotalStepsGoal(to: newGoal)
                }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(stepTrackerViewModel.stepTracker.totalStepsGoal > 1000 ? .blue : .gray)
                }
                .disabled(stepTrackerViewModel.stepTracker.totalStepsGoal <= 1000)
                
                // Increase Step Goal Button
                Button(action: {
                    let newGoal = min(stepTrackerViewModel.stepTracker.totalStepsGoal + 250, 50000) // Max 50,000
                    stepTrackerViewModel.updateTotalStepsGoal(to: newGoal)
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(stepTrackerViewModel.stepTracker.totalStepsGoal < 50000 ? .blue : .gray)
                }
                .disabled(stepTrackerViewModel.stepTracker.totalStepsGoal >= 50000)
            }
            
            Spacer()
            
            Button(action: { dismiss() }) {
                Text("Done")
                    .font(.title2)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    StepGoalEditorView(stepTrackerViewModel: StepTrackerViewModel())
}

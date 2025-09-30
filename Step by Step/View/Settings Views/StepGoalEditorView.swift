//
//  StepGoalEditorView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/2/25.
//

import SwiftUI

/// A modal view that allows the user to adjust their daily step goal.
///
/// This screen presents the current goal and allows the user to increment or decrement it
/// using buttons, with enforced boundaries between 1,000 and 50,000 steps. The UI is styled
/// to match the app’s theme, using a custom wave background and styled controls.
///
/// The updated step goal is reflected in the shared `StepTrackerViewModel`.
struct StepGoalEditorView: View {
    
    /// The shared view model that manages step tracking and goal settings.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    /// The environment property used to dismiss the modal.
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // MARK: - Background
            WaveBackground()
            
            VStack(spacing: 20) {
                Spacer()
                
                // MARK: - Title
                Text("Set Daily Step Goal")
                    .font(.title)
                    .bold()
                
                // MARK: - Current Goal
                Text("\(stepTrackerViewModel.stepTracker.totalStepsGoal) Steps")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 20)
                
                // MARK: - Increment / Decrement Controls
                HStack(spacing: 30) {
                    // Decrease Button
                    Button(action: {
                        let newGoal = max(stepTrackerViewModel.stepTracker.totalStepsGoal - 250, 1000)
                        stepTrackerViewModel.updateTotalStepsGoal(to: newGoal)
                    }) {
                        Image(systemName: "minus.circle.fill")
                            .font(.system(size: 44))
                            .foregroundStyle(
                                stepTrackerViewModel.stepTracker.totalStepsGoal > 1000 ? .blue : .gray
                            )
                    }
                    .disabled(stepTrackerViewModel.stepTracker.totalStepsGoal <= 1000)
                    
                    // Increase Button
                    Button(action: {
                        let newGoal = min(stepTrackerViewModel.stepTracker.totalStepsGoal + 250, 50000)
                        stepTrackerViewModel.updateTotalStepsGoal(to: newGoal)
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 44))
                            .foregroundStyle(
                                stepTrackerViewModel.stepTracker.totalStepsGoal < 50000 ? .blue : .gray
                            )
                    }
                    .disabled(stepTrackerViewModel.stepTracker.totalStepsGoal >= 50000)
                }
                
                Spacer()
                
                // MARK: - Done Button
                Button(action: { dismiss() }) {
                    ZStack {
                        CardView()
                        
                        Text("Done")
                            .font(AppStyle.Card.ctaFont)
                            .foregroundStyle(AppStyle.Colors.primaryText)
                    }
                    .frame(height: 92)
                }
                .padding()
            }
        }
    }
}

#Preview {
    StepGoalEditorView(stepTrackerViewModel: StepTrackerViewModel())
}

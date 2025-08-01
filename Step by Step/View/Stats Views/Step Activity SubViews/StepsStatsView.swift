//
//  StepsStatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

struct StepsStatsView: View {
    /// Observed ViewModel to track step count dynamically
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel

    var body: some View {
        VStack {
            // MARK: - Todays Steps
            Text("TODAYS \(stepTrackerViewModel.stepTracker.currentStepCount == 1 ? "STEP" : "STEPS")")
                .font(.callout)
                .kerning(1)
                .foregroundStyle(.secondary)
            
            Text("\(stepTrackerViewModel.stepTracker.currentStepCount)")
                .font(.system(size: 52,
                              weight: .bold,
                              design: .rounded)
                )
                .monospacedDigit()
                .padding(.bottom, 28)
            
            // MARK: - 7-Day Average
            HStack {
                Text("7-Day Avg")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                
                Text("\(Int(stepTrackerViewModel.stepTracker.sevenDayStepAverage))")
                    .font(.body)
                    .bold()
            }
        }
    }
}

#Preview {
    StepsStatsView(
        stepTrackerViewModel: StepTrackerViewModel()
    )
}

#Preview("DashboardView") {
    let previewAchievementsViewModel = AchievementsViewModel()
    let previewStepTrackerViewModel = StepTrackerViewModel()
    let previewStoryCardViewModel = StoryCardViewModel()
    let previewPlayerStatsViewModel = PlayerStatsViewModel()
    
    DashboardView(
        stepTrackerViewModel: previewStepTrackerViewModel,
        achievementsViewModel: previewAchievementsViewModel,
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: previewAchievementsViewModel,
            playerStatsViewModel: previewPlayerStatsViewModel
        ),
        playerStatsViewModel: previewPlayerStatsViewModel,
        storyCardViewModel: previewStoryCardViewModel
    )
}

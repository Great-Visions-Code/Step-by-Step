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

    var body: some View {
        // MARK: - Steps & 7-Day Average
        VStack {
            Text("STEPS")
                .font(.callout)
                .foregroundStyle(.gray)
            
            Text("\(stepTrackerViewModel.stepTracker.currentStepCount)")
                .font(.system(size: 52, weight: .bold))
            
            
            HStack {
                Text("7-DAY AVERAGE")
                    .font(.callout)
                    .foregroundStyle(.gray)
                
                Text("\(Int(stepTrackerViewModel.stepTracker.sevenDayStepAverage))")
                    .font(.body)
                    .bold()
            }
            .padding(.top, 4)
        }
        .padding()
    }
}

#Preview {
    StepsTakenStatsView(
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

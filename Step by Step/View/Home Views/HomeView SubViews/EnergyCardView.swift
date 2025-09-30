//
//  EnergyCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 7/23/25.
//

import SwiftUI

struct EnergyCardView: View {
    // ViewModel for managing player stats such as health and energy.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    // ViewModel for managing step tracking data.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    var body: some View {
        ZStack {
            CardView()
            
            VStack(spacing: 20){
                // MARK: - Displays the player's current energy level.
                EnergyProgressView(
                    playerStatsViewModel: playerStatsViewModel
                )
                                
                // MARK: - Button to convert steps into energy points for use in the game.
                ConvertStepsButtonView(
                    playerStatsViewModel: playerStatsViewModel,
                    stepTrackerViewModel: stepTrackerViewModel
                )
            }
        }
        .frame(width: 400, height: 168)
    }
}

#Preview {
    EnergyCardView(playerStatsViewModel: PlayerStatsViewModel(),
                   stepTrackerViewModel: StepTrackerViewModel()
    )
}

#Preview("HomeView") {
    HomeView(
        storyCardViewModel: StoryCardViewModel(),
        playerStatsViewModel: PlayerStatsViewModel(),
        stepTrackerViewModel: StepTrackerViewModel(),
        achievementsViewModel: AchievementsViewModel(),
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        )
    )
}

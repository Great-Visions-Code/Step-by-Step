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
            Rectangle()
                .foregroundStyle(.wave3)
                .opacity(0.25)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(spacing: 20){
                // MARK: - Displays the player's current energy level.
                CurrentEnergyProgressView(
                    playerStatsViewModel: playerStatsViewModel
                )
                                
                // MARK: - Button to convert steps into energy points for use in the game.
                ConvertToEnergyButtonView(
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

#Preview {
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

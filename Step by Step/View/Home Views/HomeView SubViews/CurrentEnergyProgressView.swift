//
//  CurrentEnergyProgressView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

struct CurrentEnergyProgressView: View {
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    private let maxEnergy = 10.0          // keeps the magic number central
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: "bolt.fill")
                    .font(.headline)
                Text("Energy")
                    .font(.headline)
                Spacer()
                Text("\(playerStatsViewModel.playerStats.energy)/\(Int(maxEnergy))")
                    .font(.title3)
                    .fontWeight(.bold)
                    .monospacedDigit()
            }
            HStack(spacing: 20) {
                ProgressView(
                    value: Double(playerStatsViewModel.playerStats.energy),
                    total: maxEnergy
                )
                .progressViewStyle(.linear)                 // iOS 14+ linear bar
                .tint(.blue)                               // optional brand color
                .frame(height: 4)                          // makes the bar thicker
                .clipShape(Capsule())                       // rounded ends
                .animation(.easeInOut(duration: 0.35),      // smooth fill change
                           value: playerStatsViewModel.playerStats.energy)
            }
        }
        .frame(width: 352)
    }
}

#Preview {
    let vm = PlayerStatsViewModel()
    vm.updateEnergy(to: 5)
    return CurrentEnergyProgressView(playerStatsViewModel: vm)
}

#Preview {
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

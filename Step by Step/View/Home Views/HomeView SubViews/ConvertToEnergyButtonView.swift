//
//  ConvertToEnergyButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

/// A button that converts the user's current steps into energy points.
/// This view encourages user activity by converting real-world steps into
/// game energy, rewarding progress toward their daily step goal.
struct ConvertToEnergyButtonView: View {
    
    /// ViewModel for managing player stats, such as health and energy points.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel

    /// ViewModel for managing steps taken and goals.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    /// Press animation state.
    @State private var isPressed: Bool = false
    
    /// Computed property to calculate how many energy points would be earned on tap, capped at 10.
    private var energyPoints: Int {
        let rawEnergy = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTrackerViewModel.stepTracker.stepsToConvert,
            totalStepsGoal: stepTrackerViewModel.stepTracker.totalStepsGoal
        ).energyPoints
        
        return min(rawEnergy, 10)
    }
    
    /// Determines if the button should be active.
    private var isButtonEnabled: Bool {
        energyPoints > 0
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                guard isButtonEnabled else { return }
                let newEnergy = stepTrackerViewModel.calculateEnergyPoints() + playerStatsViewModel.playerStats.energy
                playerStatsViewModel.updateEnergy(to: newEnergy)
                
                stepTrackerViewModel.commitStepsToTotal { energyPoints in
                    playerStatsViewModel.updateEnergy(
                        to: playerStatsViewModel.playerStats.energy + energyPoints
                    )
                }
            }) {
                HStack(spacing: 8) {
                    Text("Convert \(stepTrackerViewModel.stepTracker.stepsToConvert) steps")
                        .font(.title2)
                        .lineLimit(1)

                    Image(systemName: "arrow.right.circle")
                        .font(.title2)

                    Text("\(energyPoints)") // Displays capped energy conversion.
                        .font(.title2)
                        .lineLimit(1)

                    Image(systemName: "bolt.fill")
                        .font(.title2)
                }
                .frame(width: 352, height: 68)
                .background(
                    LinearGradient(
                        colors: isButtonEnabled ? [.blue.opacity(0.9), .blue] : [.gray.opacity(0.5), .gray.opacity(0.4)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        .blendMode(.overlay)
                )
                .shadow(color: isButtonEnabled ? Color.black.opacity(0.2) : .clear, radius: 6, x: 0, y: 4)
                .scaleEffect(isPressed && isButtonEnabled ? 0.97 : 1.0)
                .animation(.easeInOut(duration: 0.2), value: isPressed)
                .padding()
            }
            .disabled(!isButtonEnabled)
            .onLongPressGesture(minimumDuration: 0, maximumDistance: 50, pressing: { pressing in
                if isButtonEnabled {
                    isPressed = pressing
                }
            }, perform: {})
            
            Text("Tap to charge your Energy")
                .font(.callout)
                .foregroundStyle(isButtonEnabled ? .primary : .secondary)
        }
    }
}

#Preview {
    let playerStatsViewModel = PlayerStatsViewModel()
    let stepTrackerViewModel = StepTrackerViewModel()

    return ConvertToEnergyButtonView(
        playerStatsViewModel: playerStatsViewModel,
        stepTrackerViewModel: stepTrackerViewModel
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

//
//  ConvertToEnergyButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

/// A button that converts the user's current steps into energy points.
///
/// This view encourages user activity by converting real-world steps into
/// game energy, rewarding progress toward their daily step goal.
struct ConvertToEnergyButtonView: View {
    
    /// ViewModel for managing player stats, such as health and energy points.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel

    /// ViewModel for managing steps taken and goals.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    /// Computed property to calculate how many energy points would be earned on tap, capped at 10.
    private var energyPoints: Int {
        let rawEnergy = ConvertToEnergyViewModel.calculateStepsToEnergy(
            stepsToConvert: stepTrackerViewModel.stepTracker.stepsToConvert,
            totalStepsGoal: stepTrackerViewModel.stepTracker.totalStepsGoal
        ).energyPoints
        
        return min(rawEnergy, 10)
    }
    
    var body: some View {
        VStack {
            // A button that performs the steps-to-energy conversion and resets steps.
            Button(action: {
                let newEnergy = stepTrackerViewModel.calculateEnergyPoints() + playerStatsViewModel.playerStats.energy
                playerStatsViewModel.updateEnergy(to: newEnergy)
                
                stepTrackerViewModel.commitStepsToTotal { energyPoints in
                    playerStatsViewModel.updateEnergy(
                        to: playerStatsViewModel.playerStats.energy + energyPoints
                    )
                }
            }) {
                VStack {
                    HStack {
                        Text("Convert \(stepTrackerViewModel.stepTracker.stepsToConvert) steps")
                            .font(.title2)
                            .lineLimit(1)
                            .minimumScaleFactor(0.6)

                        Image(systemName: "arrow.right.circle")
                            .font(.system(size: 20))

                        Text("\(energyPoints)") // Displays capped energy conversion.
                            .font(.title3)
                            .lineLimit(1)
                            .minimumScaleFactor(0.6)

                        Image(systemName: "bolt.fill")
                            .font(.system(size: 20))
                    }
                }
                .frame(width: 300, height: 40)
                .bold()
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            Text("Tap to charge your Energy")
                .font(.callout)
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

//
//  StoryDecisionButton.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

/// A view that dynamically presents decision-making options to the user during the story.
struct StoryDecisionButton: View {
    /// An array of decision options, each with a title, health/energy changes, and an associated action.
    var options: [(title: String, HPChange: Int, EPChange: Int, action: () -> Void)]
    /// Current energy of the player.
    var currentEnergy: Int
    
    var body: some View {
        VStack(spacing: 10) {
            // Loop through each option provided to create a button.
            ForEach(0..<options.count, id: \.self) { index in
                let option = options[index] // Get the current option at the index.
                
                // Check if the player has enough energy to make the decision.
                if currentEnergy > 0 {
                    // Create an active button for each decision with an action.
                    Button(action: option.action) {
                        VStack(spacing: 10) {
                            // Display health and energy changes for this decision.
                            HStack(spacing: 25) {
                                Text(formatStatChange(statChangeValue: option.HPChange, statType: "Health"))
                                Text(formatStatChange(statChangeValue: option.EPChange, statType: "Energy"))
                            }
                            // Display the decision title text below the HP/EP changes.
                            Text(option.title)
                        }
                        .bold()
                        .frame(maxWidth: .infinity) // Stretch the button to fill the available width.
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                } else {
                    // Create a disabled button with a message if energy is 0.
                    VStack(spacing: 10) {
                        Text("Feeling depleted... take more steps")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
        .padding()
    }
}

#Preview {
    StoryDecisionButton(
        options: [
            (title: "Go outside to investigate",
             HPChange: -2,
             EPChange: -2,
             action: {}
            ),
            (title: "Stay inside and wait for someone to come rescue you",
             HPChange: 0,
             EPChange: 0,
             action: {}
            )
        ],
        currentEnergy: 0 // < 1, to simulate a "depleted" state.
    )
}

/// Formats the stat change value with a "+" for positive changes and appends the stat type.
/// - Parameters:
///   - statChangeValue: The stat change value (positive or negative).
///   - statType: The type of stat being displayed (e.g., "Health", "Energy").
/// - Returns: A formatted string with the stat change and type.
private func formatStatChange(statChangeValue: Int, statType: String) -> String {
    return statChangeValue > 0 ? "+\(statChangeValue) \(statType)" : "\(statChangeValue) \(statType)"
}

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
            if currentEnergy > 0 {
                // Loop through each option provided to create a button.
                ForEach(0..<options.count, id: \.self) { index in
                    let option = options[index] // Get the current option at the index.
                    
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
                }
            } else {
                // Display a single message when energy is 0.
                Text(". . . you feel tired, out of energy. But you need to keep going to survive. . . take it step by step.")
                Text("Convert Steps to Energy from the Dashboard to continue . . .")
                    .foregroundStyle(Color.blue)
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

/// Formats the stat change value with a "+" for positive changes, "-" for zero, and the raw value for negatives, appending the stat type.
/// - Parameters:
///   - statChangeValue: The stat change value (positive, negative, or zero).
///   - statType: The type of stat being displayed (e.g., "Health", "Energy").
/// - Returns: A formatted string with the stat change and type.
private func formatStatChange(statChangeValue: Int, statType: String) -> String {
    if statChangeValue > 0 {
        return "+\(statChangeValue) \(statType)"
    } else if statChangeValue == 0 {
        return "- 0 \(statType)" // Explicit "-" for zero values.
    } else {
        return "\(statChangeValue) \(statType)"
    }
}

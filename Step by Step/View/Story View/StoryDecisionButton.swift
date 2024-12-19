//
//  StoryDecisionButton.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

/// A view that presents decision-making options to the user during the story.
/// Displays two buttons, each representing a different decision with associated actions.
struct StoryDecisionButton: View {
    var body: some View {
        VStack(spacing: 10) {
            // Button for the first decision option
            Button(action: {
                // Placeholder for the action associated with Option 1
            }) {
                Text("Option 1")
                    .bold()
                    .frame(maxWidth: .infinity) // Ensures the button stretches across the available width
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20)) // Adds rounded corners to the button
            }
            
            // Button for the second decision option
            Button(action: {
                // Placeholder for the action associated with Option 2
            }) {
                Text("Option 2")
                    .bold()
                    .frame(maxWidth: .infinity) // Ensures the button stretches across the available width
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20)) // Adds rounded corners to the button
            }
        }
        .padding() // Adds padding around the entire VStack
    }
}
#Preview {
    StoryDecisionButton()
}

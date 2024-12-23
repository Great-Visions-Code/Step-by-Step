//
//  StoryDecisionButton.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

/// A view that dynamically presents decision-making options to the user during the story.
struct StoryDecisionButton: View {
    /// An array of decision options, each with a title and an associated action.
    var options: [(title: String, action: () -> Void)]
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<options.count, id: \.self) { index in
                let option = options[index]
                Button(action: option.action) {
                    Text(option.title)
                        .bold()
                        .frame(maxWidth: .infinity) // Ensures the button stretches across the available width.
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20)) // Adds rounded corners to the button.
                }
            }
        }
        .padding() // Adds padding around the entire VStack.
    }
}

#Preview {
    StoryDecisionButton(
        options: [
            (title: "Option 1", action: { print("Option 1 Selected") }),
            (title: "Option 2", action: { print("Option 2 Selected") }),
            (title: "Option 3", action: { print("Option 3 Selected") }) // Example of scalability.
        ]
    )
}

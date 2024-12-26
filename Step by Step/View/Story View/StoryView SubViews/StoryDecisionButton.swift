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
                    VStack(spacing: 10) {
                        HStack(spacing: 25) {
                            Text("-1 Health")
                            Text("-1 Energy")
                        }
                            Text(option.title)
                    }
                        .bold()
                        .frame(maxWidth: .infinity) // Ensures the button stretches across the available width.
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20)) // Adds rounded corners to the button.
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
             action: {
                 print("Option 1 Selected")
             }),
            (title: "Stay inside and wait for someone to come rescue you",
             action: {
                 print("Option 2 Selected")
             })
        ]
    )
}

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
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<options.count, id: \.self) { index in
                let option = options[index]
                Button(action: option.action) {
                    VStack(spacing: 10) {
                        HStack(spacing: 25) {
                            // HP/EP changes.
                            Text(option.HPChange > 0 ? "+\(option.HPChange) Health" : "\(option.HPChange) Health")
                            Text(option.EPChange > 0 ? "+\(option.EPChange) Energy" : "\(option.EPChange) Energy")
                        }
                            // Decision text.
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
             HPChange: -2,
             EPChange: -2,
             action: {
                 print("Option 1 Selected")
             }),
            (title: "Stay inside and wait for someone to come rescue you",
             HPChange: 0,
             EPChange: 0,
             action: {
                 print("Option 2 Selected")
             })
        ]
    )
}

//
//  StoryHomeNavigationButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// A customizable button designed for navigation actions within the Story Home screen.
/// This button provides a consistent style and supports dynamic text and actions.
struct StoryHomeNavigationButtonView: View {
    /// The text to display on the button.
    var buttonText: String
    /// An optional closure executed when the button is pressed.
    var buttonAction: (() -> Void)?
    
    var body: some View {
        Button(action: {
            // Execute the provided action, if any.
            buttonAction?()
        }) {
            // Render the button with a consistent appearance for the app's design.
            Text(buttonText)
                .font(.title3)
                .bold()
                .padding()
                .frame(width: 250) // Maintain a standard width for all buttons of this type.
                .background(Color.blue)
                .foregroundStyle(.white)
                .cornerRadius(20) // Ensure the button fits the app's rounded design language.
        }
    }
}

// MARK: - Preview

#Preview {
    StoryHomeNavigationButtonView(
        buttonText: "Start New Story",
        buttonAction: {}
    )
}

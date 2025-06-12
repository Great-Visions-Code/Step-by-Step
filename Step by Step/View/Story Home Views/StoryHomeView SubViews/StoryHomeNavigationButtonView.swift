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
    
    /// The base font to use. This is used if no explicit font size is provided.
    var font: Font
    
    /// The weight of the font (e.g., `.regular`, `.bold`, `.black`).
    var fontWeight: Font.Weight
    
    /// The width of the font characters (e.g., `.standard`, `.condensed`, `.expanded`).
    var fontWidth: Font.Width
    
    /// The design of the font (e.g., `.default`, `.serif`, `.rounded`, `.monospaced`).
    var fontDesign: Font.Design
    
    /// Optional explicit font size. If provided, overrides `font` with a system font of given size, weight, and design.
    var fontSize: CGFloat?
    
    /// The spacing between individual characters in the title.
    var kerning: CGFloat
    
    /// The color to apply to the text.
    var foregroundColor: Color
    
    var body: some View {
        Button(action: {
            // Execute the provided action, if any.
            buttonAction?()
        }) {
            // Render the button with a consistent appearance for the app's design.
            Text(buttonText)
                .font(
                    fontSize != nil
                    ? Font.system(size: fontSize!, weight: fontWeight, design: fontDesign)
                    : font
                )
                .fontWeight(fontWeight)
                .fontWidth(fontWidth)
                .kerning(kerning)
                .foregroundColor(foregroundColor)
                .padding()
                .frame(width: 250) // Maintain a standard width for all buttons of this type.
                .background(Color.blue)
                .cornerRadius(20) // Ensure the button fits the app's rounded design language.
        }
    }
}

// MARK: - Preview

#Preview {
    StoryHomeNavigationButtonView(
        buttonText: "Start New Story",
        buttonAction: {},
        font: .largeTitle,
        fontWeight: .black,
        fontWidth: .expanded,
        fontDesign: .serif,
        fontSize: 80,
        kerning: 3.5,
        foregroundColor: .white.opacity(0.9)
    )
}

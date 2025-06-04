//
//  StoryTitleTextView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/5/24.
//

import SwiftUI

/// A view that displays a stylized story title with full customization over typography.
///
/// Use this view to render a title with fine-grained control over its font size, weight, width, design, kerning, and color.
/// This is useful for views like `StoryHomeView`, where visual identity and theming are tightly coupled with story titles.
struct StoryTitleTextView: View {
    
    // MARK: - Properties
    
    /// The text to display as the title.
    var title: String
    
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
    
    // MARK: - View Body
    
    var body: some View {
        Text(title)
            .font(
                fontSize != nil
                ? Font.system(size: fontSize!, weight: fontWeight, design: fontDesign)
                : font
            )
            .fontWeight(fontWeight)
            .fontWidth(fontWidth)
            .kerning(kerning)
            .foregroundColor(foregroundColor)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        StoryTitleTextView(
            title: "Survive",
            font: .largeTitle,
            fontWeight: .black,
            fontWidth: .expanded,
            fontDesign: .serif,
            fontSize: 80,
            kerning: 3.5,
            foregroundColor: .white.opacity(0.9)
        )
        .padding()
    }
}

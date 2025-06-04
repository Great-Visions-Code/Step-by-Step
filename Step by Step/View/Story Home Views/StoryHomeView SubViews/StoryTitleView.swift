//
//  StoryTitleView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/5/24.
//

import SwiftUI

/// A view that displays a story title with full customization options for typography.
struct StoryTitleView: View {
    var title: String
    var font: Font
    var fontWeight: Font.Weight
    var fontWidth: Font.Width
    var fontDesign: Font.Design
    var fontSize: CGFloat?
    var kerning: CGFloat
    var foregroundColor: Color

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
        Color.white.ignoresSafeArea()

        StoryTitleView(
            title: "Survive",
            font: .largeTitle,
            fontWeight: .black,
            fontWidth: .expanded,
            fontDesign: .serif,
            fontSize: 80,
            kerning: 3.5,
            foregroundColor: .black
        )
    }
}

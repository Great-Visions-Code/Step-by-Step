//
//  AttemptTrackerView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// A view that displays the number of attempts the player has made to complete a story.
///
/// Useful for conveying persistence and replayability within narrative-driven games.
/// Typically shown on the story hub screen (`StoryHomeView`) as a motivational stat.
struct AttemptTrackerView: View {
    
    // MARK: - Properties
    
    /// The view model that manages achievement tracking, including story attempt count.
    @ObservedObject var achievementsViewModel: AchievementsViewModel

    /// The fallback font to use when no specific font size is provided.
    var font: Font

    /// Font weight used for styling (e.g., `.regular`, `.bold`, `.black`).
    var fontWeight: Font.Weight

    /// Font width, such as `.standard`, `.condensed`, or `.expanded`.
    var fontWidth: Font.Width

    /// The design of the font, e.g., `.default`, `.serif`, `.monospaced`, or `.rounded`.
    var fontDesign: Font.Design

    /// Optional specific font size. If provided, overrides `font` with a system-defined style.
    var fontSize: CGFloat?

    /// Character spacing between each letter.
    var kerning: CGFloat

    /// Foreground color applied to the text.
    var foregroundColor: Color

    // MARK: - View Body

    var body: some View {
        Text("Attempt #\(achievementsViewModel.achievements.attempts)")
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

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        AttemptTrackerView(
            achievementsViewModel: AchievementsViewModel(),
            font: .largeTitle,
            fontWeight: .black,
            fontWidth: .expanded,
            fontDesign: .serif,
            fontSize: 25,
            kerning: 2.5,
            foregroundColor: .white.opacity(0.9)
        )
    }
}

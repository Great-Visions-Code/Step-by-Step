//
//  StoryDayAndChapterTextView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// A view that displays the current day and chapter title for a story.
///
/// This component helps convey narrative progress to the player, showing their current in-game day,
/// chapter title, and how far along they are in the overall story.
///
/// Commonly used in views like `StoryHomeView` to reinforce the player’s current place within the story arc.
struct StoryDayAndChapterTextView: View {
    
    // MARK: - Dependencies
    
    /// The view model tracking the player's current story chapter and total number of days.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    // MARK: - Typography
    
    /// The base font to use when no specific size is given.
    var font: Font
    
    /// The weight of the font (e.g., `.regular`, `.bold`, `.black`).
    var fontWeight: Font.Weight
    
    /// The width of the font (e.g., `.condensed`, `.expanded`).
    var fontWidth: Font.Width
    
    /// The design of the font (e.g., `.serif`, `.monospaced`, `.rounded`).
    var fontDesign: Font.Design
    
    /// Optional font size for the main headline (e.g., chapter title).
    var fontSize: CGFloat?
    
    /// Optional font size for the subheadline (e.g., day tracker).
    var subheadlineSize: CGFloat?
    
    /// Spacing between characters for both labels.
    var kerning: CGFloat
    
    /// The color used for all text displayed in this view.
    var foregroundColor: Color
    
    // MARK: - View Body
    
    var body: some View {
        VStack(spacing: 10) {
            if let currentChapter = storyContentViewModel.currentChapter {
                
                // Headline: Displays current in-game day and chapter title.
                Text("Day \(currentChapter.storyDay): \"\(currentChapter.chapterTitle)\"")
                    .font(
                        fontSize != nil
                        ? Font.system(size: fontSize!, weight: fontWeight, design: fontDesign)
                        : font
                    )
                    .fontWeight(fontWeight)
                    .fontWidth(fontWidth)
                    .kerning(kerning)
                    .foregroundColor(foregroundColor)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                // Subheadline: Shows day progress (e.g., “Day 3 out of 10”).
                Text("Day \(currentChapter.storyDay) out of \(storyContentViewModel.totalDays)")
                    .font(
                        subheadlineSize != nil
                        ? Font.system(size: subheadlineSize!, weight: fontWeight, design: fontDesign)
                        : font
                    )
                    .fontWeight(fontWeight)
                    .fontWidth(fontWidth)
                    .kerning(kerning)
                    .foregroundColor(foregroundColor)
                
            } else {
                // Fallback message if no chapter data is available.
                Text("Story not found: Please return home.")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        StoryDayAndChapterTextView(
            storyContentViewModel: StoryContentViewModel(
                achievementsViewModel: AchievementsViewModel(),
                playerStatsViewModel: PlayerStatsViewModel()
            ),
            font: .largeTitle,
            fontWeight: .black,
            fontWidth: .expanded,
            fontDesign: .serif,
            fontSize: 25,
            subheadlineSize: 18,
            kerning: 3.5,
            foregroundColor: .white.opacity(0.9)
        )
    }
}

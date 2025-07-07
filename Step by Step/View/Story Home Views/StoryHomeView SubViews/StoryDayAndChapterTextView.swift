//
//  StoryDayAndChapterTextView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// A UI component that displays the current in-game day and chapter title in the story.
///
/// This view communicates narrative progress by showing the player which day they're on,
/// the title of the current chapter, and how far along they are in the story's timeline.
///
/// Commonly used in views like `StoryHomeView` to reinforce the user’s position in the story.
///
/// ### Example
/// ```swift
/// StoryDayAndChapterTextView(
///     storyContentViewModel: StoryContentViewModel(...),
///     font: .title,
///     fontWeight: .black,
///     fontWidth: .expanded,
///     fontDesign: .serif,
///     fontSize: 26,
///     subheadlineSize: 16,
///     kerning: 2.0,
///     subheadlineKerning: 1.5,
///     foregroundColor: .white
/// )
/// ```
struct StoryDayAndChapterTextView: View {
    
    // MARK: - Dependencies
    
    /// The view model containing the current story chapter and story metadata (e.g., total days).
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    // MARK: - Typography
    
    /// The fallback font if no size override is provided.
    var font: Font
    
    /// Font weight for both the headline and subheadline.
    var fontWeight: Font.Weight
    
    /// Font width (e.g., `.standard`, `.condensed`, `.expanded`) for both lines of text.
    var fontWidth: Font.Width
    
    /// The design of the font (e.g., `.serif`, `.monospaced`).
    var fontDesign: Font.Design
    
    /// Optional font size for the main headline (day and chapter title).
    var fontSize: CGFloat?
    
    /// Optional font size for the subheadline (e.g., “Day 3 out of 10”).
    var subheadlineSize: CGFloat?
    
    /// Character spacing for the headline text.
    var kerning: CGFloat
    
    /// Character spacing for the subheadline text.
    var subheadlineKerning: CGFloat
    
    /// Color applied to both text labels.
    var foregroundColor: Color
    
    // MARK: - View Body
    
    var body: some View {
        VStack(spacing: 30) {
            if let currentChapter = storyContentViewModel.currentChapter {
                
                // MARK: - Headline
                // Displays in-game day and current chapter title.
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
                
                // MARK: - Subheadline
                // Shows story progress: current day out of total days.
                Text("Days Survived \(currentChapter.storyDay)/\(storyContentViewModel.totalDays)")
                    .font(
                        subheadlineSize != nil
                        ? Font.system(size: subheadlineSize!, weight: fontWeight, design: fontDesign)
                        : font
                    )
                    .fontWeight(fontWeight)
                    .fontWidth(fontWidth)
                    .kerning(subheadlineKerning)
                    .foregroundColor(foregroundColor)
                
            } else {
                // MARK: - Fallback
                // Displayed when chapter data is missing.
                Text("Story not found: Please return home.")
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    StoryHomeView(
        story: StoryCard(
            storyTitle: "Survive",
            storyCardImage: "SurviveStoryCardImage",
            storyCompletion: 0,
            storyDetails: "DETAILS NOT SHOWN"
        ),
        playerStatsViewModel: PlayerStatsViewModel(),
        achievementsViewModel: AchievementsViewModel(),
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        ),
        onNavigateButton: { _ in }
    )
}

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
            subheadlineKerning: 2.5,
            foregroundColor: .white.opacity(0.9)
        )
    }
}

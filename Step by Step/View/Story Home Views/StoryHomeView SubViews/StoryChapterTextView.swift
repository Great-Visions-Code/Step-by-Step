//
//  StoryChapterTextView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// A view that displays the current chapter title within the story, reinforcing narrative progress.
///
/// `StoryChapterTextView` helps players stay oriented within the game's timeline by clearly showing
/// the chapter title and current in-game day. This enhances user clarity and complements other
/// progress-related UI components.
///
/// Commonly used within `StoryHomeView` to anchor the player's place in the story structure.
///
/// ### Example Usage:
/// ```swift
/// StoryChapterTextView(
///     storyContentViewModel: StoryContentViewModel(...),
///     font: .largeTitle,
///     fontWeight: .black,
///     fontWidth: .expanded,
///     fontDesign: .serif,
///     fontSize: 26,
///     kerning: 2.0,
///     foregroundColor: .white
/// )
/// ```
struct StoryChapterTextView: View {
    
    // MARK: - Dependencies
    
    /// The view model providing current chapter data and story metadata (such as total days).
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    // MARK: - Typography Configuration
    
    /// The fallback `Font` to use if no explicit `fontSize` is provided.
    let font: Font
    
    /// The font weight for the headline.
    let fontWeight: Font.Weight
    
    /// The font width variant (e.g., `.standard`, `.expanded`).
    let fontWidth: Font.Width
    
    /// The font design style (e.g., `.serif`, `.monospaced`).
    let fontDesign: Font.Design
    
    /// Optional font size for the headline.
    let fontSize: CGFloat?
    
    /// Character spacing for the headline.
    let kerning: CGFloat
    
    /// The color applied to the text content.
    let foregroundColor: Color
    
    // MARK: - View Body
    
    var body: some View {
        VStack(spacing: 30) {
            if let currentChapter = storyContentViewModel.currentChapter {
                
                // MARK: - Headline Text
                // Displays the chapter title, visually styled to align with app branding.
                Text("\"\(currentChapter.chapterTitle)\"")
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
                    .lineLimit(2) // Prevent excessive vertical expansion
            } else {
                // MARK: - Fallback Message
                // Displayed if no chapter data is available, helping users recover gracefully.
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
        
        StoryChapterTextView(
            storyContentViewModel: StoryContentViewModel(
                achievementsViewModel: AchievementsViewModel(),
                playerStatsViewModel: PlayerStatsViewModel()
            ),
            font: .largeTitle,
            fontWeight: .black,
            fontWidth: .expanded,
            fontDesign: .serif,
            fontSize: 25,
            kerning: 3.5,
            foregroundColor: .white.opacity(0.9)
        )
    }
}

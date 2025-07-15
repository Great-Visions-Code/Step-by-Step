//
//  StoryAttemptsTrackerView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// A view that displays the number of times the player has attempted the current story.
///
/// This visual indicator encourages replayability by showing how often the user has restarted or retried.
/// It is commonly used in the `StoryHomeView` as a motivational stat.
///
/// - Important: This view observes `AchievementsViewModel`, and updates automatically when attempts change.
///
/// ## Example
/// ```swift
/// StoryAttemptsTrackerView(
///     achievementsViewModel: AchievementsViewModel(),
///     font: .title2,
///     fontWeight: .bold,
///     fontWidth: .expanded,
///     fontDesign: .serif,
///     fontSize: 22,
///     kerning: 2.0,
///     foregroundColor: .white
/// )
/// ```
struct StoryAttemptsTrackerView: View {
    
    // MARK: - Dependencies
    
    /// ViewModel that holds story attempt data and updates dynamically.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    
    // MARK: - Typography Configuration
    
    /// Fallback font if `fontSize` is not explicitly provided.
    var font: Font
    
    /// Thickness or heaviness of the font.
    var fontWeight: Font.Weight
    
    /// Width of the characters (e.g., `.condensed`, `.expanded`).
    var fontWidth: Font.Width
    
    /// Font design style, such as `.serif` or `.rounded`.
    var fontDesign: Font.Design
    
    /// Optional custom font size. If provided, overrides the base `font`.
    var fontSize: CGFloat?
    
    /// Letter spacing between characters.
    var kerning: CGFloat
    
    /// The foreground color for the text label.
    var foregroundColor: Color

    // MARK: - View Body
    
    var body: some View {
        Text("Attempt: \(achievementsViewModel.achievements.attempts)")
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

// MARK: - Preview (Minimal Component)

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        StoryAttemptsTrackerView(
            achievementsViewModel: AchievementsViewModel(),
            font: .largeTitle,
            fontWeight: .black,
            fontWidth: .expanded,
            fontDesign: .serif,
            fontSize: 25,
            kerning: 1.0,
            foregroundColor: .white.opacity(0.95)
        )
    }
}

// MARK: - Preview (Contextual Integration in StoryHomeView)

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

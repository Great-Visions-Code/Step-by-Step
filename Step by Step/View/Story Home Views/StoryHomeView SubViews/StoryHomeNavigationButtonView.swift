//
//  StoryHomeNavigationButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// A stylized navigation button used on the Story Home screen.
///
/// This reusable button supports customizable text, action, font styling, and background color.
/// Designed for use within the story selection and navigation flow, ensuring consistent appearance
/// across the app's user interface.
///
/// - Note: This button defaults to a fixed width and corner radius to align with design patterns
/// used throughout `Step by Step`.
///
/// ### Example
/// ```swift
/// StoryHomeNavigationButtonView(
///     buttonText: "Resume",
///     buttonAction: { print("Resume tapped") },
///     font: .headline,
///     fontWeight: .bold,
///     fontWidth: .expanded,
///     fontDesign: .serif,
///     fontSize: 18,
///     kerning: 2.0,
///     foregroundColor: .white,
///     backgroundColor: Color.blue.opacity(0.2)
/// )
/// ```
struct StoryHomeNavigationButtonView: View {
    
    // MARK: - Content & Behavior
    
    /// The title shown inside the button.
    var buttonText: String
    
    /// Optional action executed when the button is tapped.
    var buttonAction: (() -> Void)?
    
    // MARK: - Typography
    
    /// Base font used when `fontSize` is not provided.
    var font: Font
    
    /// Font weight (e.g., `.regular`, `.bold`, `.black`) applied to the label.
    var fontWeight: Font.Weight
    
    /// Font width variation (e.g., `.standard`, `.expanded`).
    var fontWidth: Font.Width
    
    /// Design style of the font (e.g., `.serif`, `.monospaced`, `.rounded`).
    var fontDesign: Font.Design
    
    /// Optional font size override. If provided, it replaces the `font` value with a `system` font.
    var fontSize: CGFloat?
    
    /// Letter spacing for the button label.
    var kerning: CGFloat
    
    // MARK: - Styling
    
    /// Text color for the button label.
    var foregroundColor: Color
    
    /// Optional background color for the button’s capsule. If `nil`, background is transparent.
    var backgroundColor: Color?
    
    // MARK: - View Body
    
    var body: some View {
        Button(action: {
            buttonAction?()
        }) {
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
                .frame(width: 350)
                .background(backgroundColor)
                .cornerRadius(20)
        }
    }
}

// MARK: - Previews

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
        
        StoryHomeNavigationButtonView(
            buttonText: "Start New Story",
            buttonAction: {},
            font: .largeTitle,
            fontWeight: .black,
            fontWidth: .expanded,
            fontDesign: .serif,
            fontSize: 18,
            kerning: 3.5,
            foregroundColor: .white.opacity(0.9),
            backgroundColor: Color.white.opacity(0.15)
        )
    }
}

//
//  StoryHomeNavigationButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// A reusable navigation button designed for consistency within the Story Home screen.
///
/// `StoryHomeNavigationButtonView` provides a fixed-size, rounded rectangle button with
/// large, readable typography. It supports dynamic text and an optional action closure.
/// This button reinforces the app’s visual identity with uniform styling across navigation flows.
///
/// ### Example Usage:
/// ```swift
/// StoryHomeNavigationButtonView(
///     buttonText: "Resume",
///     buttonAction: { print("Resume tapped") }
/// )
/// ```
///
/// - Note: This button is intended for primary navigation within the story experience.
struct StoryHomeNavigationButtonView: View {
    
    // MARK: - Properties
    
    /// The text displayed on the button.
    let buttonText: String
    
    /// The action triggered when the user taps the button. This is optional.
    let buttonAction: (() -> Void)?
    
    // MARK: - View Body
    
    var body: some View {
        Button(action: {
            buttonAction?()
        }) {
            Text(buttonText)
                .font(.largeTitle)               
                .fontWeight(.bold)
                .fontDesign(.monospaced)
                .frame(width: 352, height: 68)
                .background(Color.white.opacity(0.30))
                .foregroundStyle(.white.opacity(0.95))
                .clipShape(RoundedRectangle(cornerRadius: 20))
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
            buttonAction: {}
        )
    }
}

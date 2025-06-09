//
//  AttemptTrackerView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// A view that displays how many times the user has attempted the story.
///
/// This component is typically displayed in the story hub (`StoryHomeView`) to show how often
/// a player has restarted, emphasizing replayability and progression.
///
/// Example usage:
/// ```swift
/// AttemptTrackerView(achievementsViewModel: AchievementsViewModel())
/// ```
struct AttemptTrackerView: View {
    
    // MARK: - Properties
    
    /// View model responsible for tracking the number of story attempts as part of achievements.
    @ObservedObject var achievementsViewModel: AchievementsViewModel

    // MARK: - View Body

    var body: some View {
        Text("Attempt #\(achievementsViewModel.achievements.attempts)")
            .font(.system(size: 25, design: .serif))
            .fontWeight(.black)
            .kerning(2.5)
            .foregroundStyle(Color.white.opacity(0.9))
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        AttemptTrackerView(
            achievementsViewModel: AchievementsViewModel()
        )
    }
}

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

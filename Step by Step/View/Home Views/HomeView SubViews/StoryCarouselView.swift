//
//  StoryCarouselView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// A horizontally scrollable view that displays a list of interactive story cards the player can select from.
///
/// - Features a prominent title.
/// - Each story card can show progress and be tapped to begin or continue a story.
/// - Stories like "SURVIVE" dynamically reflect player progress, while others may be locked or marked as "Coming Soon".
/// - Includes a scroll transition for enhanced visual feedback.
struct StoryCarouselView: View {
    
    /// The list of stories to display, bound to external state.
    @Binding var stories: [StoryCard]
    
    /// The view model responsible for loading and updating dynamic story progress.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    /// Closure triggered when the user selects a story card.
    var onStorySelected: (StoryCard) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Title
            Text("Stories")
                .font(.title)
                .opacity(0.95)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            // MARK: - Scrollable Story Cards
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 8) {
                    ForEach($stories, id: \.storyTitle) { $story in
                        Group {
                            if story.storyTitle == "SURVIVE" {
                                // Dynamic story with real-time progress
                                StoryCardView(
                                    story: $story,
                                    storyContentViewModel: storyContentViewModel,
                                    onTitleCardSelected: {
                                        onStorySelected(story)
                                    }
                                )
                            } else {
                                // Static or upcoming stories
                                StoryCardView(
                                    story: $story,
                                    storyContentViewModel: nil,
                                    onTitleCardSelected: {
                                        onStorySelected(story)
                                    }
                                )
                            }
                        }
                        // Applies visual feedback during horizontal scroll
                        .scrollTransition(axis: .horizontal) { effect, phase in
                            effect
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.88)
                                .opacity(phase.isIdentity ? 1.0 : 0.24)
                                .offset(y: phase.isIdentity ? 0 : 4)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(16, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    @Previewable @State var stories = [
        StoryCard(
            storyTitle: "SURVIVE",
            storyCardImage: "SurviveStoryCardImage",
            storyCompletion: 50,
            storyDetails: "Dynamic completion story."
        ),
        StoryCard(
            storyTitle: "Stay Tuned",
            storyCardImage: "ComingSoonStoryCardImage",
            storyCompletion: 0,
            storyDetails: "Static completion story."
        )
    ]
    
    return StoryCarouselView(
        stories: $stories,
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        ),
        onStorySelected: { _ in }
    )
}

#Preview("Dashboard") {
    let previewAchievementsViewModel = AchievementsViewModel()
    let previewStepTrackerViewModel = StepTrackerViewModel()
    let previewStoryCardViewModel = StoryCardViewModel()
    let previewPlayerStatsViewModel = PlayerStatsViewModel()
    
    return DashboardView(
        stepTrackerViewModel: previewStepTrackerViewModel,
        achievementsViewModel: previewAchievementsViewModel,
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: previewAchievementsViewModel,
            playerStatsViewModel: previewPlayerStatsViewModel
        ),
        playerStatsViewModel: previewPlayerStatsViewModel,
        storyCardViewModel: previewStoryCardViewModel
    )
}

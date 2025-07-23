//
//  ChooseYourAdventureView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// A horizontal carousel that allows the user to scroll through and select interactive story cards.
///
/// Displays a title prompt followed by a horizontally scrollable list of story previews.
/// Designed to highlight one primary story ("Survive") with live progress tracking,
/// while also supporting static preview cards like "Stay Tuned" or upcoming titles.
struct ChooseYourAdventureView: View {
    
    /// A dynamic list of all available stories for display and interaction.
    @Binding var stories: [StoryCard]
    
    /// The view model responsible for updating completion percentages dynamically for active stories.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    /// Callback triggered when a story is selected.
    var onStorySelected: (StoryCard) -> Void
    
    var body: some View {
        VStack() {
            // MARK: - Title
            Text("Stories")
                .font(.title2.bold())
                .padding(.horizontal)
                .padding(.top)

            // MARK: - Scrollable Story Cards
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 20) {
                    ForEach($stories, id: \.storyTitle) { $story in
                        // "Survive" supports live dynamic tracking.
                        if story.storyTitle == "SURVIVE" {
                            StoryCardView(
                                story: $story,
                                storyContentViewModel: storyContentViewModel,
                                onTitleCardSelected: {
                                    onStorySelected(story)
                                }
                            )
                        } else {
                            // Static preview cards for future or locked stories.
                            StoryCardView(
                                story: $story,
                                storyContentViewModel: nil,
                                onTitleCardSelected: {
                                    onStorySelected(story)
                                }
                            )
                        }
                    }
                }
                .padding(.top, 5)
            }
        }
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
    return ChooseYourAdventureView(
        stories: $stories,
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        ),
        onStorySelected: { _ in }
    )
}

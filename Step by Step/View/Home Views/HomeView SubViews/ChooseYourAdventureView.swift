//
//  ChooseYourAdventureView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// A view that displays a horizontal list of story cards, allowing users to select a story.
struct ChooseYourAdventureView: View {
    /// A binding array of `StoryCard` objects representing the available stories.
    @Binding var stories: [StoryCard]
    
    /// The `StoryContentViewModel` to track and update the dynamic completion percentage.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    /// Closure to handle the selection of a story, notifying the parent view.
    var onStorySelected: (StoryCard) -> Void
    
    var body: some View {
        VStack {
            // Display the section title to prompt users to choose a story.
            Text("Choose Your Adventure:")
                .font(.title2)
                .bold()
                .padding(.top)
            
            // Horizontal scroll view displaying a collection of story cards.
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 15) {
                    // Dynamically generate a card for each story in the `stories` array.
                    ForEach($stories, id: \.title) { $story in
                        // Pass dynamic updates only for "Survive."
                        if story.title == "Survive" {
                            StoryCardView(
                                story: $story, // Pass a binding to the story card.
                                storyContentViewModel: storyContentViewModel, // Pass ViewModel for dynamic updates.
                                onTitleCardSelected: {
                                    // Notify the parent view when a story card is selected.
                                    onStorySelected(story)
                                }
                            )
                        } else {
                            // Render static stories like "Future Adventures."
                            StoryCardView(
                                story: $story, // Pass a binding to the story card.
                                storyContentViewModel: nil, // Pass nil to prevent dynamic updates.
                                onTitleCardSelected: {
                                    // Notify the parent view when a story card is selected.
                                    onStorySelected(story)
                                }
                            )
                        }
                    }
                }
                .padding(.horizontal, 40) // Center the story cards within the scroll view.
            }
            .padding(.top)
        }
    }
}

#Preview {
    @Previewable @State var stories = [
        StoryCard(
            title: "Survive",
            color: Color.green,
            completion: 50,
            details: "Dynamic completion story."
        ),
        StoryCard(
            title: "Future Adventures",
            color: Color.gray,
            completion: 0,
            details: "Static completion story."
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

//
//  ChooseYourAdventureView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// A view that displays a horizontal list of story cards, allowing users to select a story.
struct ChooseYourAdventureView: View {
    /// An array of `StoryCard` objects representing the available stories.
    var stories: [StoryCard]
    
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
                    ForEach(stories, id: \.title) { story in
                        StoryCardView(
                            story: story,
                            onTitleCardSelected: {
                                // Notify the parent view when a story card is selected.
                                onStorySelected(story)
                            }
                        )
                    }
                }
                .padding(.horizontal, 40) // Center the story cards within the scroll view.
            }
            .padding(.top)
        }
    }
}

#Preview {
    let stories = [
        StoryCard(
            title: "Story Title 1",
            color: Color.green,
            completion: 100,
            details: "DETAILS NOT SHOWN"
        ),
        StoryCard(
            title: "Story Title 2",
            color: Color.gray,
            completion: 0,
            details: "DETAILS NOT SHOWN"
        )
    ]
    ChooseYourAdventureView(
        stories: stories,
        onStorySelected: { _ in }
    )
}

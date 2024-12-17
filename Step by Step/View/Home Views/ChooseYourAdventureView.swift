//
//  ChooseYourAdventureView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

struct ChooseYourAdventureView: View {
    // Array from StoryTitleCardModel.swift
    var stories: [StoryTitleCard]
    // Closure to notify parent about the selected story
    var onStorySelected: (StoryTitleCard) -> Void
    
    var body: some View {
        VStack {
            // MARK: Display Title
            Text("Choose Your Adventure:")
                .font(.title2)
                .bold()
                .padding(.top)
            
            // MARK: HScroll section for StoryTitleCard
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 15) {
                    // ForEach loop to generate title cards
                    ForEach(stories, id: \.title) { story in
                        StoryTitleCardView(
                            story: story,
                            onTitleCardSelected: {
                                onStorySelected(story)
                            }
                        )
                    }
                }
                // Center title cards
                .padding(.horizontal, 40)
            }
            .padding(.top)
        }
    }
}

#Preview {
    let stories = [
        StoryTitleCard(
            title: "Story Title 1",
            color: Color.green,
            completion: 100,
            details: "DETAILS NOT SHOWN"
        ),
        StoryTitleCard(
            // NOTE: On 100% completion, 'title' will scale down
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

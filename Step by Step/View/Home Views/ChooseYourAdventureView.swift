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
    // Closure to notify parent when to navigate
    var onEnterStory: () -> Void
    // Selected story passed to the parent view
    var onStorySelected: (StoryTitleCard) -> Void
    
    @State private var selectedStory: StoryTitleCard? = nil
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        VStack {
            // MARK: Display Title
            Text("Choose Your Adventure:")
                .font(.title2)
                .bold()
                .padding(.top)
            
            // MARK: H. Scroll section for story title cards
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 15) {
                    // ForEach loop to generate title cards
                    ForEach(stories, id: \.title) { story in
                        StoryTitleCardView(
                            story: story,
                            selectedStory: $selectedStory,
                            isSheetPresented: $isSheetPresented
                        )
                    }
                }
                // Center title cards
                .padding(.horizontal, 40)
            }
            .padding(.top)
        }
        // MARK: Sheet presentation GV 12/1/24
        .sheet(isPresented: $isSheetPresented) {
            if let story = selectedStory {
                StoryDetailSheetView(
                    story: story,
                    onEnterStory: {
                        onStorySelected(story)
                        onEnterStory()
                    }
                )
            }
        }
    }
}


// Sample data for testing IN PREVIEW
let stories = [
    StoryTitleCard(
        title: "Story Title 1",
        color: Color.green,
        completion: 100,
        details: "SAMPLE: 'Story Title 1', this is where we would show the details of the story."
    ),
    StoryTitleCard(
        // NOTE: On 100% completion, Story Title will scale down
        title: "Story Title 2",
        color: Color.gray,
        completion: 0,
        details: "SAMPLE: 'Story Title 2', this is where we would show the details of the story."
    )
]

#Preview {
    ChooseYourAdventureView(
        stories: stories,
        onEnterStory: {},
        onStorySelected: { _ in }
    )
}

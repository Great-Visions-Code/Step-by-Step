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
                // Center title cards IN DashboardView.swift
                .padding(.horizontal, 28)
            }
            .padding(.top)
        }
        // MARK: Sheet presentation GV 12/1/24
        .sheet(isPresented: $isSheetPresented) {
            if let story = selectedStory {
                StoryDetailSheetView(
                    story: story,
                    onEnterStory: onEnterStory
                )
            }
        }
    }
}


// Sample data for testing IN PREVIEW
let stories = [
    StoryTitleCard(
        title: "Survive",
        color: Color.green,
        completion: 100,
        details: "In 'Survive', navigate a post-apocalyptic world while battling zombies and managing resources. Your choices shape your fate."
    ),
    StoryTitleCard(
        title: "Future Adventures",
        color: Color.gray,
        completion: 0,
        details: "Stay tuned for upcoming thrilling adventures that will test your strategy and creativity!"
    )
]

#Preview {
    ChooseYourAdventureView(
        stories: stories,
        onEnterStory: {}
    )
}

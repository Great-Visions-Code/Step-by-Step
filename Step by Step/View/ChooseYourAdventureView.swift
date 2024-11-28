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
    
    var body: some View {
        // Display Title
        Text("Choose Your Adventure:")
            .font(.title2)
            .bold()
            .padding(.top)
        
        // Horizontal scroll section for story title cards
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 15) {
                // ForEach loop to generate title cards
                ForEach(stories, id: \.title) { story in
                    StoryTitleCardView(
                        title: "\(story.title)\n\nComplete: \(story.completion)%",
                        color: story.color
                    )
                }
            }
            // Center title cards IN DashboardView.swift
            .padding(.horizontal, 28)
        }
        .padding(.top)
    }
}

// Sample data FOR PREVIEW
let stories = [
    StoryTitleCard(title: "Survive Step by Step",
                   color: Color.green,
                   completion: 10),
    StoryTitleCard(title: "Future Adventures",
                   color: Color.gray,
                   completion: 0)
]

#Preview {
    ChooseYourAdventureView(stories: stories)
}

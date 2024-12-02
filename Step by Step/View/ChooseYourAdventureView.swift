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
    
    // State to manage the selected story and Sheet presentation
    @State private var selectedStory: StoryTitleCard? = nil
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        VStack {
            // Display Title
            Text("Choose Your Adventure:")
                .font(.title2)
                .bold()
                .padding(.top)
            
            // MARK: Horizontal scroll section for story title cards
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
                StoryDetailSheetView(story: story)
            }
        }
    }
}


// Sample data FOR PREVIEW
let stories = [
    StoryTitleCard(title: "Survive",
                   color: Color.green,
                   completion: 100),
    StoryTitleCard(title: "Future Adventures",
                   color: Color.gray,
                   completion: 0)
]

#Preview {
    ChooseYourAdventureView(stories: stories)
}

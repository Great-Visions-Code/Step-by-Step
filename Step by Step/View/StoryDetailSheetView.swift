//
//  StoryDetailSheetView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/1/24.
//

import SwiftUI

struct StoryDetailSheetView: View {
    // Selected story to display details
    var story: StoryTitleCard
        
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Push text to middle of screen
                Spacer()
                
                // MARK: Story Title GV 12/1/24
                Text(story.title)
                    .font(.largeTitle)
                    .bold()
                
                // MARK: Completion percentage GV 12/1/24
                Text("Completion: \(story.completion)%")
                    .font(.headline)
                
                // MARK: Story details GV 12/1/24
                // TODO: Create story.details in StoryTitleCard.swift GV 12/01/24
                // Display details about the story
                Text("More details about the story will go here. This can include a description, goals, or additional context.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                
                // Push button down
                Spacer()
                
                // MARK: Story's Home Button GV 12/1/24
                // Navigate to the story's home page
                NavigationLink(
                    destination: StoryHomeView()
                ) {
                        Text("Enter Story")
                            .font(.title2)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .cornerRadius(20)
                }
            }
            .padding()
        }
        // Control adjustable sheet height
        .presentationDetents([.medium, .large])
    }
}

#Preview {
    StoryDetailSheetView(
        story: StoryTitleCard(
            // Sample data to show IN PREVIEW
            title: "Survive",
            color: .green,
            completion: 100
        )
    )
}

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
        VStack(spacing: 20) {
            // Push text to middle of screen
            Spacer()
            
            // Display story title
            Text(story.title)
                .font(.largeTitle)
                .bold()
            
            // Display completion %
            Text("Completion: \(story.completion)%")
                .font(.headline)
            
            // TODO: Create story.details in StoryTitleCard.swift GV 12/01/24
            // Display details about the story
            Text("More details about the story will go here. This can include a description, goals, or additional context.")
                .font(.body)
                .foregroundStyle(.secondary)
            
            // Push button down
            Spacer()
            
            // MARK: Story's Home Button
            // Navigate to the story's home page
            Button(action: {
                // TODO: Add navigation to story's home page GV 12/01/24
            }) {
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
        // Optional: Control sheet height
        // .presentationDetents([.medium, .large])
    }
}

#Preview {
    StoryDetailSheetView(
        story: StoryTitleCard(
            // Sample data to show IN PREVIEW
            title: "Survive Step by Step",
            color: .green,
            completion: 100
        )
    )
}

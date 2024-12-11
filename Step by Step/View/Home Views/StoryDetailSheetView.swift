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
    // Closure to notify parent when Enter Story button is tapped
    var onEnterStory: () -> Void
        
    var body: some View {
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
                Text(story.details)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Push button down
                Spacer()
                
                // MARK: Story's Home Button GV 12/1/24
                Button(action: {
                    onEnterStory()
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
    }
}

#Preview {
    StoryDetailSheetView(
        story: StoryTitleCard(
            title: "Story Title in sheet",
            color: .green,
            completion: 100,
            details: "SAMPLE: 'Story Title', this is where we would show the details of the story."
        ),
        onEnterStory: {}
    )
}

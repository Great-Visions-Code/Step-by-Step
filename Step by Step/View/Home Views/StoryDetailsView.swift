//
//  StoryDetailsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/1/24.
//

import SwiftUI

struct StoryDetailsView: View {
    // Selected story to display details
    var story: StoryTitleCard
    // Closure to notify parent when Enter Story button is tapped
    var onEnterStoryButton: () -> Void
        
    var body: some View {
            VStack(spacing: 20) {
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
                
                Spacer()
                
                // MARK: Enter Story Button GV 12/1/24
                Button(action: {
                    onEnterStoryButton()
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
            // Hide navigation back button since TabView is visible
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryDetailsView(
        story: StoryTitleCard(
            title: "Story Title",
            color: .green,
            completion: 100,
            details: """
                    SAMPLE: 'Story Title', this is where we would show the details of the story.
                    
                    Lorem ipsum odor amet, consectetuer adipiscing elit. Conubia inceptos magna enim nec neque dictum erat himenaeos integer. Purus dolor posuere parturient sapien elit venenatis ante felis. Id placerat facilisi magna habitasse velit tortor. Cras eu duis quam vehicula arcu. Purus pulvinar eros suspendisse leo ligula scelerisque pulvinar. Tincidunt sem massa luctus egestas ligula vehicula. Nostra velit mollis ac tortor nisi pellentesque. Semper curae venenatis ultrices libero fusce primis quisque.
                    """
        ),
        onEnterStoryButton: {}
    )
}

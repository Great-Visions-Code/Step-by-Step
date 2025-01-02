//
//  StoryDetailsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/1/24.
//

import SwiftUI

/// Displays detailed information about a selected story, including its title, completion percentage, and description.
/// Provides an option for the user to "Enter Story," which navigates to the main story view.
struct StoryDetailsView: View {
    // The story object containing title, color, completion, and details to be displayed.
    var story: StoryCard
    // Closure to handle the action when the "Enter Story" button is pressed.
    var onEnterStoryButton: () -> Void
        
    var body: some View {
        VStack(spacing: 20) {
            Spacer() // Spacer to push content towards the center of the screen.
            
            // Display the story title prominently.
            Text(story.title)
                .font(.largeTitle)
                .bold()
            
            // Show the completion percentage of the story.
            Text("Completion: \(story.completion)%")
                .font(.headline)
            
            Divider()
            
            // Scrollable section for the story's detailed description.
            ScrollView(.vertical, showsIndicators: true) {
                Text(story.details)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .frame(height: 450) // Adjust the height as needed.
                        
            // Conditionally show the "Enter Story" button.
            if story.title != "Future Adventures" {
                Button(action: {
                    onEnterStoryButton() // Trigger the closure to navigate to the main story view.
                }) {
                    Text("Enter Story")
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity) // Make the button span the full width.
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(20)
                }
            }
        }
        .padding()
        // Hide the default navigation back button as the TabView is visible for navigation.
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryDetailsView(
        story: StoryCard(
            title: "Story Title",
            color: .green,
            completion: 100,
            details: """
                    SAMPLE: 'Story Title', this is where we would show the details of the story.
                    
                    Lorem ipsum odor amet, consectetuer adipiscing elit. Conubia inceptos magna enim nec neque dictum erat himenaeos integer. Purus dolor posuere parturient sapien elit venenatis ante felis. Id placerat facilisi magna habitasse velit tortor. Cras eu duis quam vehicula arcu. Purus pulvinar eros suspendisse leo ligula scelerisque pulvinar. Tincidunt sem massa luctus egestas ligula vehicula. Nostra velit mollis ac tortor nisi pellentesque. Semper curae venenatis ultrices libero fusce primis quisque.
                    
                    Lorem ipsum odor amet, consectetuer adipiscing elit. Conubia inceptos magna enim nec neque dictum erat himenaeos integer. Purus dolor posuere parturient sapien elit venenatis ante felis. Id placerat facilisi magna habitasse velit tortor. Cras eu duis quam vehicula arcu. Purus pulvinar eros suspendisse leo ligula scelerisque pulvinar. Tincidunt sem massa luctus egestas ligula vehicula. Nostra velit mollis ac tortor nisi pellentesque. Semper curae venenatis ultrices libero fusce primis quisque.
                    """
        ),
        onEnterStoryButton: {}
    )
}

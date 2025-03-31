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
    // The story object containing title, color, and details to be displayed.
    var story: StoryCard
    
    // Optional ViewModel to observe the current story's completion percentage dynamically.
    var storyContentViewModel: StoryContentViewModel?
    
    // Closure to handle the action when the "Enter Story" button is pressed.
    var onEnterStoryButton: () -> Void
        
    var body: some View {
        VStack(spacing: 20) {
            // Display the story title prominently.
            Spacer()
            Text(story.storyTitle)
                .font(.largeTitle)
                .bold()
            
            // Show the completion percentage dynamically for "Survive" or static for others.
            if story.storyTitle == "Survive" {
                Text("Completion: \(storyContentViewModel?.completionPercentage ?? 0)%")
                    .font(.subheadline)
            } else {
                Text("Completion: 0%") // Static completion for other stories like "Stay Tuned".
                    .font(.subheadline)
            }
            
            Divider()
            
            // Scrollable section for the story's detailed description.
            ScrollView(.vertical, showsIndicators: true) {
                Text(story.storyDetails)
                    .font(.headline)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            // Conditionally show the "Enter Story" button.
            if story.storyTitle != "Stay Tuned" {
                Button(action: {
                    onEnterStoryButton() // Trigger the closure to navigate to the main story view.
                }) {
                    Text("Enter Story")
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(width: 300, height: 70)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(20)
                }
            }
        }
        .padding(.bottom)
        // Hide the default navigation back button as the TabView is visible for navigation.
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryDetailsView(
        story: StoryCard(
            storyTitle: "Story Title",
            storyCardColor: .green,
            storyCompletion: 0,
            storyDetails: """
                    SAMPLE: 'Story Title', this is where we would show the details of the story.
                    
                     Lorem ipsum odor amet, consectetuer adipiscing elit. Conubia inceptos magna enim nec neque dictum erat himenaeos integer. Purus dolor posuere parturient sapien elit venenatis ante felis. Id placerat facilisi magna habitasse velit tortor. Cras eu duis quam vehicula arcu. Purus pulvinar eros suspendisse leo ligula scelerisque pulvinar. Tincidunt sem massa luctus egestas ligula vehicula. Nostra velit mollis ac tortor nisi pellentesque. Semper curae venenatis ultrices libero fusce primis quisque.
                                        
                    Lorem ipsum odor amet, consectetuer adipiscing elit. Conubia inceptos magna enim nec neque dictum erat himenaeos integer. Purus dolor posuere parturient sapien elit venenatis ante felis. Id placerat facilisi magna habitasse velit tortor. Cras eu duis quam vehicula arcu. Purus pulvinar eros suspendisse leo ligula scelerisque pulvinar. Tincidunt sem massa luctus egestas ligula vehicula. Nostra velit mollis ac tortor nisi pellentesque. Semper curae venenatis ultrices libero fusce primis quisque.
                    """
        ),
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        ),
        onEnterStoryButton: {}
    )
}

//
//  StoryDetailsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/1/24.
//

import SwiftUI

/// Displays detailed information about a selected story, including a dynamic banner,
/// completion status, and a description with an action to enter the story.
struct StoryDetailsView: View {
    // The story object containing title, color, and details to be displayed.
    var story: StoryCard

    // Optional ViewModel to observe the current story's completion percentage dynamically.
    var storyContentViewModel: StoryContentViewModel?

    // Closure to handle the action when the "Enter Story" button is pressed.
    var onEnterStoryButton: () -> Void

    /// Determines which banner image to use based on the story's title.
    private var bannerImageName: String {
        story.storyTitle == "Survive" ? "SurviveBannerImage" : "ComingSoonBannerImage"
    }

    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Banner Section
            ZStack(alignment: .bottom) {
                Image(bannerImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 225)
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                Rectangle()
                    .opacity(0.4)
                    .frame(maxWidth: .infinity, minHeight: 75, maxHeight: 75)
                
                // MARK: - Story Title & Completion
                VStack(spacing: 8) {
                    Text(story.storyTitle)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                    
                    if story.storyTitle == "Survive" {
                        Text("Completion: \(storyContentViewModel?.completionPercentage ?? 0)%")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                    } else {
                        Text("More adventures in the works!")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.bottom, 7)
            }

            // MARK: - Description & Enter Button
            ScrollView {
                VStack(spacing: 20) {
                    Text(story.storyDetails)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding()

                    if story.storyTitle != "Stay Tuned" {
                        Button(action: onEnterStoryButton) {
                            Text("Enter Story")
                                .font(.title2)
                                .bold()
                                .frame(width: 300, height: 70)
                                .background(Color.blue)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top) // Allow banner to extend to screen top
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryDetailsView(
        story: StoryCard(
            storyTitle: "Survive",
            storyCardImage: "SurviveStoryCardImage",
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

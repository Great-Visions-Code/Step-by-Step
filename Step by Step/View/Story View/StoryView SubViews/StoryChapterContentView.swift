//
//  StoryChapterContentView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

/// A view that displays the content of a chapter in the story.
/// This includes a chapter title, an image, narrative text, and decision buttons for user interaction.
struct StoryChapterContentView: View {
    /// ViewModel to manage the current story content, including chapters and decisions.
    @ObservedObject var storyContentViewModel: StoryContentViewModel

    var body: some View {
        ScrollView {
            if let currentChapter = storyContentViewModel.currentChapter {
                VStack(spacing: 20) {
                    // Displays the chapter title for the current story section.
                    Text(currentChapter.chapterTitle)
                        .font(.title)
                        .bold()
                    
                    // Display the first image in the chapter, if available.
                    if let imageName = currentChapter.chapterImages.first {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                    }
                    
                    // Displays the narrative content for the chapter.
                    Text(currentChapter.chapterText)
                        .font(.body)
                        .padding()
                    
                    Spacer()
                    
                    // Buttons for user decisions related to the current chapter.
                    StoryDecisionButton(
                        options: currentChapter.chapterDecisions.compactMap { decision in
                            // Check if the decision has a valid nextChapterID.
                            if let nextChapterID = decision.nextChapterID {
                                // Return a tuple containing the decision details to create a button.
                                return (
                                    title: decision.decisionText, // The text describing the decision.
                                    HPChange: decision.HPChange, // The health change associated with the decision.
                                    EPChange: decision.EPChange, // The energy change associated with the decision.
                                    action: {
                                        // Update the story chapter when the button is pressed.
                                        storyContentViewModel.updateCurrentChapter(
                                            to: nextChapterID, // The chapter to navigate to after making the decision.
                                            HPChange: decision.HPChange, // Apply health change based on the decision.
                                            EPChange: decision.EPChange // Apply energy change based on the decision.
                                        )
                                    }
                                )
                            } else {
                                // If the decision doesn't have a valid nextChapterID, exclude it.
                                return nil
                            }
                        }
                    )
                }
            } else {
                // Fallback UI if no chapter is loaded.
                Text("No Chapter Available")
                    .font(.title)
                    .padding()
            }
        }
    }
}

#Preview {
    StoryChapterContentView(
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        )
    )
}

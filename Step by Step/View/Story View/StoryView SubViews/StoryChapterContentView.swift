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
                            if let nextChapterID = decision.nextChapterID {
                                return (
                                    title: decision.decisionText,
                                    HPChange: decision.HPChange,
                                    EPChange: decision.EPChange,
                                    action: {
                                        storyContentViewModel.updateCurrentChapter(
                                            to: nextChapterID,
                                            HPChange: decision.HPChange,
                                            EPChange: decision.EPChange
                                        )
                                    }
                                )
                            } else {
                                // Log an error for debugging.
                                print("Invalid decision: Missing nextChapterID for \(decision.decisionText).")
                                return nil // Exclude this decision from the resulting array.
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

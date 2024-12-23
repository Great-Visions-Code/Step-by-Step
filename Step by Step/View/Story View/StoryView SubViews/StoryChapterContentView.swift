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
                            // Ensure the nextChapterID is non-nil before creating a button.
                            guard let nextChapterID = decision.nextChapterID else { return nil }
                            return (title: decision.decisionText, action: {
                                storyContentViewModel.updateCurrentChapter(to: nextChapterID)
                            })
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
        storyContentViewModel: StoryContentViewModel()
    )
}

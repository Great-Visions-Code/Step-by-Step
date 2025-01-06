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
    /// ViewModel to manage the player's stats, such as health and energy.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    /// Unique ID for resetting the scroll position.
    @State private var scrollAnchorID = "ScrollToTop"

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 20) {
                    if let currentChapter = storyContentViewModel.currentChapter {
                        // Displays the chapter title for the current story section.
                        Text(currentChapter.chapterTitle)
                            .font(.title)
                            .bold()
                            .id(scrollAnchorID) // Anchor to scroll to the top.
                        
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
                                            // Update the story chapter when the button is pressed.
                                            storyContentViewModel.updateCurrentChapter(
                                                to: nextChapterID,
                                                HPChange: decision.HPChange,
                                                EPChange: decision.EPChange
                                            )
                                        }
                                    )
                                } else {
                                    return nil
                                }
                            },
                            currentEnergy: playerStatsViewModel.playerStats.energy
                        )
                    } else {
                        // Fallback UI if no chapter is loaded.
                        Text("No Chapter Available")
                            .font(.title)
                            .padding()
                    }
                }
            }
            // Observes changes to the `currentChapter` property in the `storyContentViewModel`.
            // This modifier triggers whenever the current chapter is updated, allowing
            // the UI to respond dynamically to changes in the story.
            .onChange(of: storyContentViewModel.currentChapter, initial: false) { _, _ in
                // Animates the scrolling action to the top of the scroll view.
                // The `proxy.scrollTo` function uses `scrollAnchorID` to identify the top
                // of the scrollable content, ensuring the user starts reading the new chapter
                // from the beginning.
                withAnimation {
                    proxy.scrollTo(scrollAnchorID, anchor: .top)
                }
            }
        }
    }
}

#Preview {
    StoryChapterContentView(
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        ),
        playerStatsViewModel: PlayerStatsViewModel()
    )
}

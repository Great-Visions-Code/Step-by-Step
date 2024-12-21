//
//  StoryContentViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/21/24.
//

import SwiftUI

/// ViewModel for managing story content, including chapter and decisions.
class StoryContentViewModel: ObservableObject {
    /// Stores all chapters for the current story.
    @Published private(set) var chapters: [StoryContent] = []
    /// Tracks the current chapter being displayed.
    @Published private(set) var currentChapter: StoryContent?
    
    /// Initializes the ViewModel with predefined chapters for the story.
    init() {
        loadSurviveStory()
    }
    
    /// Loads the "Survive Step by Step" story content.
    private func loadSurviveStory() {
        chapters = [
            StoryContent(
                storyDay: 1,
                chapterTitle: "The Beginning",
                chapterImages: ["placeholderdashimage"],
                chapterText: """
                    You wake up to chaos. The world outside your window is unrecognizable, with fires burning and eerie silence in the streets.
                    What will you do first?
                    """,
                chapterDecisions: [
                    ChapterDecision(decisionText: "Run outside to investigate", nextChapterID: 2),
                    ChapterDecision(decisionText: "Lock the door and gather supplies", nextChapterID: 3)
                ]
            ),
            StoryContent(
                storyDay: 1,
                chapterTitle: "Outside Chaos",
                chapterImages: ["day1-outside-chaos-imagenamedashimage"],
                chapterText: """
                    The streets are deserted, but danger lurks around every corner. You spot a figure stumbling toward you.
                    """,
                chapterDecisions: [
                    ChapterDecision(decisionText: "Confront the figure", nextChapterID: 4),
                    ChapterDecision(decisionText: "Hide and observe", nextChapterID: 5)
                ]
            ),
            // Add more chapters as needed
        ]
        // Start with the first chapter.
        currentChapter = chapters.first
    }
    
    /// Updates the current chapter based on the player's decision.
    /// - Parameter nextChapterID: The ID of the next chapter.
    func updateCurrentChapter(to nextChapterID: Int) {
        if let nextChapter = chapters.first(where: { $0.storyDay == nextChapterID }) {
            currentChapter = nextChapter
        }
    }
}

//
//  StoryContentViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/21/24.
//

import SwiftUI

/// ViewModel for managing story content, including chapters and decisions.
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
            // Day 1: Chapter 1
            StoryContent(
                chapterID: 1,
                storyDay: 1,
                chapterTitle: "The Beginning",
                chapterImages: ["survive-day1-beginning-bedroomView-image"],
                chapterText: """
                    You wake up to chaos. The world outside your window is unrecognizable, with fires burning and eerie silence in the streets.
                    What will you do first?
                    """,
                chapterDecisions: [
                    ChapterDecision(decisionText: "Go outside to investigate", nextChapterID: 99), // Death Chapter
                    ChapterDecision(decisionText: "Stay inside and lock the door", nextChapterID: 2) // Day 1: Chapter 2
                ],
                isFinalChapter: false
            ),
            // Day 1: Chapter 2
            StoryContent(
                chapterID: 2,
                storyDay: 1,
                chapterTitle: "Stay Put",
                chapterImages: ["survive-day1-stayput-kitchenNoise-image"],
                chapterText: """
                    You hear a noise in the kitchen. It’s unclear if it’s a person or something worse.
                    Do you investigate or make a run for it?
                    """,
                chapterDecisions: [
                    ChapterDecision(decisionText: "Investigate the noise", nextChapterID: 99), // Death Chapter
                    ChapterDecision(decisionText: "Make a run for it", nextChapterID: 3) // Day 2: Chapter 1
                ],
                isFinalChapter: false
            ),
            // Day 2: Chapter 1
            StoryContent(
                chapterID: 3,
                storyDay: 2,
                chapterTitle: "New Day",
                chapterImages: ["survive-day2-newDay-shelter-image"],
                chapterText: """
                    You find shelter for the night, but you’re unsure how to proceed. Will you take shelter or explore?
                    """,
                chapterDecisions: [
                    ChapterDecision(decisionText: "Explore the surroundings", nextChapterID: 99), // Death Chapter
                    ChapterDecision(decisionText: "Take shelter and rest", nextChapterID: 100) // Survive Chapter
                ],
                isFinalChapter: false
            ),
            // General: Death Chapter
            StoryContent(
                chapterID: 99,
                storyDay: 0,
                chapterTitle: "Death",
                chapterImages: ["survive-death-image"],
                chapterText: """
                    Your decision led to an untimely end. The world is harsh, and survival is not guaranteed.
                    """,
                chapterDecisions: [],
                isFinalChapter: true
            ),
            // General: Survive Chapter
            StoryContent(
                chapterID: 100,
                storyDay: 0,
                chapterTitle: "Survive",
                chapterImages: ["survive-ending-image"],
                chapterText: """
                    Congratulations! You made it through the chaos and survived against all odds.
                    This is the end of your journey.
                    """,
                chapterDecisions: [],
                isFinalChapter: true
            )
        ]
        // Start with the first chapter.
        currentChapter = chapters.first
    }

    /// Updates the current chapter based on the player's decision.
    /// - Parameter nextChapterID: The ID of the next chapter.
    func updateCurrentChapter(to nextChapterID: Int) {
        if let nextChapter = chapters.first(where: { $0.chapterID == nextChapterID }) {
            currentChapter = nextChapter
        }
    }
}

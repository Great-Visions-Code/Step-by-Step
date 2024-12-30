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
    /// Tracks the last viewed chapter's ID.
    private var lastViewedChapterID: Int?
    /// Reference to AchievementsViewModel for tracking attempts.
    private let achievementsViewModel: AchievementsViewModel
    /// Reference to PlayerStatsViewModel for managing health and energy changes.
    private let playerStatsViewModel: PlayerStatsViewModel

    /// Initializes the ViewModel with predefined chapters for the story.
    ///
    /// This initializer sets up the required dependencies for managing story progress and interacts with other ViewModels such as `AchievementsViewModel` and `PlayerStatsViewModel`.
    ///
    /// - Parameters:
    ///   - achievementsViewModel: A reference to the achievements manager for tracking story-related achievements and progress.
    ///   - playerStatsViewModel: A reference to the player stats manager for updating health and energy values based on decisions.
    init(achievementsViewModel: AchievementsViewModel, playerStatsViewModel: PlayerStatsViewModel) {
        // This enables tracking attempts and milestones throughout the story.
        self.achievementsViewModel = achievementsViewModel
        // This ensures health and energy changes are managed across the app.
        self.playerStatsViewModel = playerStatsViewModel
        
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
                    ChapterDecision(decisionText: "Go outside to investigate", nextChapterID: 99, HPChange: -1, EPChange: -1), // Death Chapter
                    ChapterDecision(decisionText: "Stay inside and lock the door", nextChapterID: 2, HPChange: -1, EPChange: -1) // Day 1: Chapter 2
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
                    ChapterDecision(decisionText: "Investigate the noise", nextChapterID: 99, HPChange: -2, EPChange: -2), // Death Chapter
                    ChapterDecision(decisionText: "Make a run for it", nextChapterID: 3, HPChange: -1, EPChange: -1) // Day 2: Chapter 1
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
                    ChapterDecision(decisionText: "Explore the surroundings", nextChapterID: 99, HPChange: -3, EPChange: -3), // Death Chapter
                    ChapterDecision(decisionText: "Take shelter and rest", nextChapterID: 100, HPChange: -1, EPChange: -1) // Survive Chapter
                ],
                isFinalChapter: false
            ),
            // General: Death Chapter
            StoryContent(
                chapterID: 99,
                storyDay: 0, // This will be dynamically updated.
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
                storyDay: 0, // This will be dynamically updated.
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
        lastViewedChapterID = currentChapter?.chapterID
    }

    /// A computed property to determine the last story day.
    private var lastStoryDay: Int {
        chapters.map { $0.storyDay }.max() ?? 0
    }

    /// Resets the story to Day 1 Chapter 1 and increments the attempt counter.
    func resetStory() {
        currentChapter = chapters.first
        lastViewedChapterID = currentChapter?.chapterID
        achievementsViewModel.incrementAttempts() // Increment attempts here.
    }

    /// Updates the current chapter based on the player's decision.
    /// - Parameters:
    ///   - nextChapterID: The ID of the next chapter.
    ///   - HPChange: The change in health points.
    ///   - EPChange: The change in energy points.
    func updateCurrentChapter(to nextChapterID: Int, HPChange: Int, EPChange: Int) {
        // Apply the decision's health and energy changes first.
        playerStatsViewModel.applyStatChanges(HPChange: HPChange, EPChange: EPChange)
        
        // Check if the player's health has dropped to 0.
        if playerStatsViewModel.playerStats.health <= 0 {
            // Automatically set the current chapter to the Death Chapter.
            if let deathChapter = chapters.first(where: { $0.chapterID == 99 }) {
                currentChapter = deathChapter
                lastViewedChapterID = deathChapter.chapterID
            }
            return // Exit early since the player is dead.
        }
        
        // Find the next chapter based on the decision.
        if var nextChapter = chapters.first(where: { $0.chapterID == nextChapterID }) {
            // Update `storyDay` dynamically for special chapters.
            if nextChapter.chapterID == 99 || nextChapter.chapterID == 100 {
                nextChapter = StoryContent(
                    chapterID: nextChapter.chapterID,
                    storyDay: lastStoryDay, // Use the last story day.
                    chapterTitle: nextChapter.chapterTitle,
                    chapterImages: nextChapter.chapterImages,
                    chapterText: nextChapter.chapterText,
                    chapterDecisions: nextChapter.chapterDecisions,
                    isFinalChapter: nextChapter.isFinalChapter
                )
            }
            currentChapter = nextChapter
            lastViewedChapterID = nextChapterID // Update last viewed chapter ID.
        }
    }

    /// Resumes the last viewed chapter.
    func resumeStory() {
        if let lastChapterID = lastViewedChapterID,
           let lastChapter = chapters.first(where: { $0.chapterID == lastChapterID }) {
            currentChapter = lastChapter
        }
    }

    /// A computed property to get the total number of unique story days.
    var totalDays: Int {
        let uniqueDays = Set(chapters.map { $0.storyDay }).filter { $0 > 0 }
        return uniqueDays.count
    }
}

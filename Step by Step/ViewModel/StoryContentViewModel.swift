//
//  StoryContentViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/21/24.
//

import SwiftUI

/// ViewModel for managing story content, including chapters, decisions, and player progress.
class StoryContentViewModel: ObservableObject {
    /// All chapters available in the current story.
    /// This is a read-only property to ensure chapters are only updated internally.
    @Published private(set) var chapters: [StoryContent] = []
    
    /// The currently active chapter being displayed.
    @Published private(set) var currentChapter: StoryContent?
    
    /// The ID of the last viewed chapter, used for resuming progress.
    private var lastViewedChapterID: Int?
    
    /// Reference to the `AchievementsViewModel` for tracking milestones like attempts.
    private let achievementsViewModel: AchievementsViewModel
    
    /// Reference to the `PlayerStatsViewModel` for managing health and energy point changes.
    private let playerStatsViewModel: PlayerStatsViewModel
    
    /// Initializes the ViewModel with required dependencies and preload story content.
    ///
    /// - Parameters:
    ///   - achievementsViewModel: Tracks story-related achievements and milestones.
    ///   - playerStatsViewModel: Manages player health and energy points for story decisions.
    init(achievementsViewModel: AchievementsViewModel, playerStatsViewModel: PlayerStatsViewModel) {
        self.achievementsViewModel = achievementsViewModel
        self.playerStatsViewModel = playerStatsViewModel
        loadSurviveStory()
    }
    
    // MARK: - Story Loading
    
    /// Loads the predefined chapters for the "Survive Step by Step" story.
    ///
    /// This function initialized the story structure, including key decisions, chapter metadata,
    /// and special chapters (e.g., "Death" or "Survive").
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
                    Do you find a place to hide and wait or make a run for it?
                    """,
                chapterDecisions: [
                    ChapterDecision(decisionText: "Find a place to rest", nextChapterID: 4, HPChange: 1, EPChange: -2), // Day 1: Chapter 4
                    ChapterDecision(decisionText: "Make a run for it", nextChapterID: 3, HPChange: -1, EPChange: -1) // Day 2: Chapter 1
                ],
                isFinalChapter: false
            ),
            // Day 1: Chapter 4
            StoryContent(
                chapterID: 4,
                storyDay: 1,
                chapterTitle: "What Now?",
                chapterImages: ["survive-day1-whatNow-brokenWindow-image"],
                chapterText: """
                    You hear a window break. It’s unclear if it’s a friendly person or something else.
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
                    ChapterDecision(decisionText: "Take shelter and rest", nextChapterID: 100, HPChange: 0, EPChange: -1) // Survive Chapter
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
    
    // MARK: - Chapter Navigation

    /// Updates the current chapter based on the player's decision.
    ///
    /// This function adjusts player health and energy based on the decision's effects.
    /// If health reaches zero, the player transitions to the "Death" chapter. Otherwise,
    /// the function navigates to the specified next chapter and updates the progress.
    ///
    /// - Parameters:
    ///   - nextChapterID: The ID of the chapter to navigate to.
    ///   - HPChange: The health points adjustment caused by the decision.
    ///   - EPChange: The energy points adjustment caused by the decision.
    func updateCurrentChapter(to nextChapterID: Int, HPChange: Int, EPChange: Int) {
        // Apply health and energy changes based on the decision.
        playerStatsViewModel.applyStatChanges(HPChange: HPChange, EPChange: EPChange)
        
        // Determine the current and next story day, ensuring it stays within valid bounds.
        let currentStoryDay = currentChapter?.storyDay ?? 1
        let nextStoryDay = min(currentStoryDay + 1, maxStoryDay)
        
        // Transition to the Death Chapter if health is zero or below.
        if playerStatsViewModel.playerStats.health <= 0 {
            transitionToSpecialChapter(chapterID: 99, storyDay: max(currentStoryDay, nextStoryDay))
            return
        }
        
        // Find and navigate to the next chapter.
        if var nextChapter = chapters.first(where: { $0.chapterID == nextChapterID }) {
            // Adjust the story day for the Survive Chapter, if applicable.
            if nextChapter.chapterID == 100 {
                nextChapter = StoryContent(
                    chapterID: nextChapter.chapterID,
                    storyDay: max(currentStoryDay, nextStoryDay),
                    chapterTitle: nextChapter.chapterTitle,
                    chapterImages: nextChapter.chapterImages,
                    chapterText: nextChapter.chapterText,
                    chapterDecisions: nextChapter.chapterDecisions,
                    isFinalChapter: nextChapter.isFinalChapter
                )
            }
            currentChapter = nextChapter
            lastViewedChapterID = nextChapterID
        }
    }

    /// Transitions to a special chapter (e.g., Death or Survive) and updates the story day.
    ///
    /// This helper function ensures the `storyDay` is dynamically adjusted for special chapters,
    /// like the "Death" or "Survive" chapters, while maintaining consistency.
    ///
    /// - Parameters:
    ///   - chapterID: The ID of the special chapter to transition to.
    ///   - storyDay: The story day to assign to the special chapter.
    private func transitionToSpecialChapter(chapterID: Int, storyDay: Int) {
        if var specialChapter = chapters.first(where: { $0.chapterID == chapterID }) {
            specialChapter = StoryContent(
                chapterID: specialChapter.chapterID,
                storyDay: storyDay,
                chapterTitle: specialChapter.chapterTitle,
                chapterImages: specialChapter.chapterImages,
                chapterText: specialChapter.chapterText,
                chapterDecisions: specialChapter.chapterDecisions,
                isFinalChapter: specialChapter.isFinalChapter
            )
            currentChapter = specialChapter
            lastViewedChapterID = specialChapter.chapterID
        }
    }

    /// Resets the story to the first chapter and increments the attempt counter.
    ///
    /// This method is typically called when the player chooses to start a new game.
    func resetStory() {
        currentChapter = chapters.first
        lastViewedChapterID = currentChapter?.chapterID
        achievementsViewModel.incrementAttempts()
    }

    /// Resumes the last viewed chapter.
    ///
    /// This method allows the player to continue the story from where they left off.
    func resumeStory() {
        if let lastChapterID = lastViewedChapterID,
           let lastChapter = chapters.first(where: { $0.chapterID == lastChapterID }) {
            currentChapter = lastChapter
        }
    }

    // MARK: - Utility Methods

    /// Computes the total number of unique story days in the current story.
    ///
    /// This property calculates the number of distinct `storyDay` values across
    /// all chapters, excluding special chapters with `storyDay` set to 0.
    var totalDays: Int {
        Set(chapters.map { $0.storyDay }).filter { $0 > 0 }.count
    }

    /// Determines the highest story day in the story.
    ///
    /// This property identifies the highest `storyDay` value present in the story.
    private var maxStoryDay: Int {
        chapters.map { $0.storyDay }.max() ?? 0
    }
}

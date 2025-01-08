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
    
    /// The current completion percentage for the story.
    @Published var completionPercentage: Int = 0
    
    /// Mapping of `chapterID` to completion percentage.
    private let chapterCompletionMapping: [Int: Int] = [
        1: 100,
        9: 0,
        11: 0,
        12: 2,
        13: 4,
        14: 5,
        15: 7,
        16: 9,
        21: 10
    ]
    
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

    /// Loads the chapters for the "Survive" story from an external data source.
    ///
    /// This method retrieves the predefined story structure, including narrative details,
    /// player decisions, and metadata, from the `SurviveStory` data file.
    /// It initializes the story's starting point by setting the first chapter as the current chapter.
    private func loadSurviveStory() {
        // Load Survive Step by Step Story
        chapters = SurviveStory.chapters
        // Set the first chapter as the starting point.
        currentChapter = chapters.first
        lastViewedChapterID = currentChapter?.chapterID
        // Initialize completion percentage.
        updateCompletionPercentage(for: currentChapter?.chapterID)
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
            // Update completion percentage based on the new chapter ID.
            updateCompletionPercentage(for: nextChapter.chapterID)
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
            // Update completion percentage for special chapters.
            updateCompletionPercentage(for: specialChapter.chapterID)
        }
    }
    
    /// Updates the completion percentage based on the given chapterID.
    ///
    /// This method retrieves the corresponding percentage from the mapping and updates the
    /// published `completionPercentage` property.
    ///
    /// - Parameter chapterID: The ID of the chapter to calculate the completion percentage for.
    private func updateCompletionPercentage(for chapterID: Int?) {
        guard let chapterID = chapterID else { return }
        completionPercentage = chapterCompletionMapping[chapterID] ?? 0
    }
    
    /// Resets the story to the first chapter and increments the attempt counter.
    ///
    /// This method is typically called when the player chooses to start a new game.
    func resetStory() {
        currentChapter = chapters.first
        lastViewedChapterID = currentChapter?.chapterID
        achievementsViewModel.incrementAttempts()
        // Reset completion percentage to 0.
        updateCompletionPercentage(for: currentChapter?.chapterID)
    }

    /// Resumes the last viewed chapter.
    ///
    /// This method allows the player to continue the story from where they left off.
    func resumeStory() {
        if let lastChapterID = lastViewedChapterID,
           let lastChapter = chapters.first(where: { $0.chapterID == lastChapterID }) {
            currentChapter = lastChapter
            // Update completion percentage based on the resumed chapter.
            updateCompletionPercentage(for: lastChapter.chapterID)
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

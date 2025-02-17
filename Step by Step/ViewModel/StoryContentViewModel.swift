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
    @Published private(set) var chapters: [StoryContent] = []
    
    /// The currently active chapter being displayed.
    @Published private(set) var currentChapter: StoryContent?
    
    /// The current completion percentage for the story.
    @Published var completionPercentage: Int = 0
    
    /// UserDefaults key for storing the last viewed chapter ID.
    private let lastChapterIDKey = "lastChapterID"

    /// Mapping of `chapterID` to completion percentage.
    static let chapterCompletionMapping: [Int: Int] = [
        1: 100, 9: 0,
        11: 0, 12: 3, 13: 6, 14: 8, 15: 11, 16: 14,
        21: 17, 22: 20, 23: 24, 24: 27, 25: 30,
        31: 33, 32: 37, 33: 42, 34: 46,
        41: 50, 42: 57, 43: 63, 44: 70, 45: 76,
        51: 83, 52: 86, 53: 90, 54: 93, 55: 97, 56: 100
    ]
    
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

    /// Loads the chapters for the "Survive" story and resumes progress if available.
    private func loadSurviveStory() {
        // Load Survive Story
        chapters = SurviveStory.chapters

        // Load last viewed chapter if available
        let savedChapterID = loadLastViewedChapterID()
        
        if let lastChapter = chapters.first(where: { $0.chapterID == savedChapterID }) {
            currentChapter = lastChapter
        } else {
            // Start from the first chapter if no saved progress exists
            currentChapter = chapters.first
        }
        
        // Persist the last viewed chapter ID
        saveLastViewedChapterID(currentChapter?.chapterID)
        
        // Update completion percentage
        updateCompletionPercentage(for: currentChapter?.chapterID)
    }
    
    // MARK: - Chapter Navigation

    /// Updates the current chapter based on the player's decision.
    func updateCurrentChapter(to nextChapterID: Int, HPChange: Int, EPChange: Int) {
        // Apply health and energy changes
        playerStatsViewModel.applyStatChanges(HPChange: HPChange, EPChange: EPChange)
        
        // Transition to the Death Chapter if health reaches 0
        if playerStatsViewModel.playerStats.health <= 0 {
            transitionToSpecialChapter(chapterID: 9)
            return
        }
        
        // Navigate to the selected chapter if found
        if let nextChapter = chapters.first(where: { $0.chapterID == nextChapterID }) {
            currentChapter = nextChapter
            saveLastViewedChapterID(nextChapterID) // Persist progress
            updateCompletionPercentage(for: nextChapter.chapterID)
        }
    }

    /// Transitions to a special chapter (e.g., Death).
    private func transitionToSpecialChapter(chapterID: Int) {
        if let specialChapter = chapters.first(where: { $0.chapterID == chapterID }) {
            currentChapter = specialChapter
            saveLastViewedChapterID(specialChapter.chapterID) // Persist progress
            
            if chapterID == 9 {
                // Reduce player's health to 0 if transitioning to the Death Chapter
                playerStatsViewModel.decreaseHealth(by: playerStatsViewModel.playerStats.health)
            }
            
            updateCompletionPercentage(for: specialChapter.chapterID)
        }
    }
    
    /// Updates the completion percentage based on the given chapter ID.
    private func updateCompletionPercentage(for chapterID: Int?) {
        guard let chapterID = chapterID else { return }
        completionPercentage = StoryContentViewModel.chapterCompletionMapping[chapterID] ?? 0
    }
    
    /// Resets the story to the first chapter and increments the attempt counter.
    func resetStory() {
        currentChapter = chapters.first
        saveLastViewedChapterID(currentChapter?.chapterID) // Reset progress
        achievementsViewModel.incrementAttempts()
        updateCompletionPercentage(for: currentChapter?.chapterID)
    }

    /// Resumes the last viewed chapter.
    func resumeStory() {
        let savedChapterID = loadLastViewedChapterID()
        if let lastChapter = chapters.first(where: { $0.chapterID == savedChapterID }) {
            currentChapter = lastChapter
            updateCompletionPercentage(for: lastChapter.chapterID)
        }
    }
    
    // MARK: - Persistence Functions

    /// Saves the last viewed chapter ID persistently.
    private func saveLastViewedChapterID(_ chapterID: Int?) {
        guard let chapterID = chapterID else { return }
        UserDefaults.standard.set(chapterID, forKey: lastChapterIDKey)
    }
    
    /// Loads the last viewed chapter ID from storage.
    ///
    /// - Returns: The saved chapter ID or defaults to the first chapter.
    private func loadLastViewedChapterID() -> Int {
        return UserDefaults.standard.integer(forKey: lastChapterIDKey)
    }
    
    // MARK: - Utility Methods

    /// Computes the total number of unique story days in the current story.
    var totalDays: Int {
        Set(chapters.map { $0.storyDay }).filter { $0 > 0 }.count
    }
}

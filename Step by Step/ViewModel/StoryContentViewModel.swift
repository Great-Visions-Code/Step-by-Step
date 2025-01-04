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
                chapterID: 11,
                storyDay: 1,
                chapterTitle: "The Beginning",
                chapterImages: ["survive-day1-beginning-bedroomView-image"],
                chapterText: """
                    The sound pulls you violently from sleep—piercing, relentless, and unfamiliar. Not an alarm clock. Not a car horn. It’s something darker, sharper. The kind of noise that makes your chest clench and your pulse race before your mind even has time to process.

                    Your breath catches as you bolt upright, eyes darting around your room. Shadows flicker on the walls, faint and jagged, cast by a dim, pulsing light sneaking through the edges of your curtains. The air feels heavy, electric, like the world outside is holding its breath.

                    That sound—it’s blaring, vibrating through your skull like an air raid siren. You’ve never heard anything like it before, except maybe in disaster movies. But this isn’t a movie. This is your life, your neighborhood. And neighborhoods like yours don’t make noises like this.

                    You swing your legs off the bed, your heart pounding in your chest. The floor feels cold under your feet as you stumble toward the window. Every instinct screams at you to stay put, but the pull of curiosity is too strong. With trembling fingers, you grab the edge of the curtain and peel it back.

                    Your stomach lurches.

                    Outside, the world is chaos. Cars are stopped in the middle of the street, some still running, headlights cutting weakly through a haze of smoke. People are running—sprinting, really—screaming as they scatter in all directions. A woman stumbles over a curb, clutching a child in her arms. Behind her, something follows.

                    Not someone. Something.

                    The figure lurches after her, its movements wrong, unnatural. Its head jerks sharply, snapping toward her like it’s on a string. It moves faster than you expect, closing the gap. She screams again, the sound piercing through the sirens, before it leaps. You see her fall. You see her stop moving.

                    You stagger back from the window, bile rising in your throat. Your mind races, trying to piece together what you just saw. No. This can’t be real. It doesn’t make sense.

                    The sirens drone on, loud and unrelenting, pressing into your thoughts like a vice. You glance at your nightstand. Your phone sits there, vibrating frantically, its screen lighting up with notifications. Emergency alerts? Texts? A loved one trying to reach you?

                    Your eyes flick to the TV remote on the dresser. Maybe the news will explain this—maybe it’ll tell you it’s some kind of hoax, some kind of terrible mistake.

                    But then your gaze shifts to the door. The pull of the unknown outside, the need to know if this is really happening, feels overwhelming. Maybe if you just open the door, step outside, you’ll see something that makes this all make sense. Or maybe you won’t.

                    Your hands tremble as the weight of the moment presses down on you. What do you do?
                    """,
                chapterDecisions: [
                    ChapterDecision(decisionText: "Open the front door to see if this is real", nextChapterID: 9, HPChange: 0, EPChange: 0), // Death Chapter
                    ChapterDecision(decisionText: "Grab your phone or turn on the TV to seek comfort or answers", nextChapterID: 1, HPChange: 0, EPChange: 0) // Day 1: Chapter 2
                ],
                isFinalChapter: false
            ),
            // General: Death Chapter
            StoryContent(
                chapterID: 9,
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
                chapterID: 1,
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

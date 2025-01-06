//
//  StoryContent.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/21/24.
//

import Foundation

/// Model representing the content of a chapter within a story.
///
/// This struct encapsulates all the key details for a chapter, including its ID,
/// narrative, images, decisions, and whether it's a terminal (final) chapter.
struct StoryContent: Equatable {
    /// A unique identifier for the chapter.
    ///
    /// Each chapter in the story must have a unique ID to differentiate it from others,
    /// allowing the app to navigate between chapters effectively.
    let chapterID: Int
    
    /// The in-game day associated with this chapter.
    ///
    /// This represents the chronological progression within the story.
    /// Chapters belonging to the same day may depict different events or branching paths.
    let storyDay: Int
    
    /// The title of the chapter.
    ///
    /// Used as a heading for the chapter in the UI, giving users context
    /// about the current section of the story.
    let chapterTitle: String
    
    /// An array of image names or URLs associated with this chapter.
    ///
    /// This property stores references to images that visually represent the chapter's content,
    /// such as illustrations or scenes from the story. The first image in the array
    /// is typically used as the primary visual.
    let chapterImages: [String]
    
    /// The narrative text providing the main content for the chapter.
    ///
    /// This is the core story text displayed to the user, delivering the narrative
    /// for the chapter and setting up the decisions they must make.
    let chapterText: String
    
    /// The decisions available to the player, along with their associated effects and next chapter IDs.
    ///
    /// This property defines the choices users can make within the chapter.
    /// Each decision specifies:
    /// - `decisionText`: The text displayed on the decision button.
    /// - `nextChapterID`: The ID of the chapter to navigate to if the decision is chosen.
    /// - `HPChange` and `EPChange`: The impact on the player's health and energy points.
    let chapterDecisions: [ChapterDecision]
    
    /// Indicates if this chapter is a terminal chapter (e.g., "Death" or "Survive").
    ///
    /// Terminal chapters represent the end of a story path, such as achieving victory
    /// or encountering a game-over scenario. No further decisions can be made in these chapters.
    let isFinalChapter: Bool
}

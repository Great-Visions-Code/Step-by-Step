//
//  StoryContent.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/21/24.
//

import Foundation
import SwiftUI

/// Model representing the content of a chapter within a story.
struct StoryContent {
    /// A unique identifier for the chapter.
    let chapterID: Int
    /// The in-game day associated with this chapter.
    let storyDay: Int
    /// The title of the chapter.
    let chapterTitle: String
    /// An array of image names or URL's for the chapter.
    let chapterImages: [String]
    /// The narrative text for the chapter.
    let chapterText: String
    /// The decisions available to the player, along with their associated next chapter IDs.
    let chapterDecisions: [ChapterDecision]
    /// Indicates if this chapter is a terminal chapter (e.g., "Death" or "Survive").
    let isFinalChapter: Bool
}

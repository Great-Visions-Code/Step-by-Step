//
//  ChapterDecision.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/21/24.
//

import Foundation

/// A model representing a decision available within a chapter.
///
/// Each `ChapterDecision` defines the player's choice, its consequences
/// (e.g., health and energy changes), and the next chapter it leads to.
struct ChapterDecision: Equatable {
    /// The description of the decision displayed to the player.
    let decisionText: String
    
    /// The ID of the next chapter this decision leads to, if any.
    ///
    /// A `nil` value indicates the decision does not lead to another chapter
    /// (e.g., the end of the story or an invalid choice).
    let nextChapterID: Int?
    
    /// The change in health points caused by making this decision.
    ///
    /// Positive values increase health, while negative values decrease it.
    let HPChange: Int
    
    /// The change in energy points caused by making this decision.
    ///
    /// Positive values increase energy, while negative values decrease it.
    let EPChange: Int
}

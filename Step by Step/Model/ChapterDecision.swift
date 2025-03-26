//
//  ChapterDecision.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/21/24.
//

import Foundation

/// A model that defines a single interactive decision available to the player within a chapter.
///
/// Each `ChapterDecision` represents a possible choice the player can make,
/// including the outcome of that choice—such as health or energy point changes—and
/// the navigation logic to the next chapter in the story.
struct ChapterDecision: Equatable {
    
    /// The text shown to the user as the decision option.
    ///
    /// This string is typically rendered as a button label within the chapter view.
    /// It should clearly communicate what action the player is taking.
    let decisionText: String
    
    /// The identifier of the next chapter that follows this decision.
    ///
    /// A `nil` value indicates that the decision does not lead to another chapter.
    /// This can be used for terminal branches like endings, death, or blocked paths.
    let nextChapterID: Int?
    
    /// The amount of health to modify based on this decision.
    ///
    /// A positive value increases the player's health; a negative value decreases it.
    /// For example, `-10` might represent taking damage, while `+5` could indicate finding a health kit.
    let HPChange: Int
    
    /// The amount of energy to modify based on this decision.
    ///
    /// A positive value increases the player's energy points; a negative value reduces them.
    /// For example, `-3` could reflect the physical toll of running, while `+2` may result from resting.
    let EPChange: Int
}

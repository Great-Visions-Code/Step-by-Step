//
//  StoryCard.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import Foundation
import SwiftUI

/// A data model representing a story card displayed in the game’s dashboard or story selection interface.
///
/// Each `StoryCard` encapsulates metadata and styling for a story preview,
/// including its title, color theme, progress, and description.
struct StoryCard: Hashable {
    
    // MARK: - Properties

    /// The title of the story shown on the card.
    ///
    /// This is used as a label for the card and displayed prominently to the user.
    let storyTitle: String

    /// The background color of the card, providing visual identity for the story.
    ///
    /// This helps differentiate stories in the UI using consistent color themes.
    let storyCardColor: Color

    /// The percentage of the story completed by the user.
    ///
    /// This value should be in the range of `0` to `100`, representing how far the user has progressed.
    var storyCompletion: Int

    /// A short description or narrative context for the story.
    ///
    /// This text gives the user an idea of the story’s premise or tone.
    let storyDetails: String
}

//
//  StoryCard.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import Foundation
import SwiftUI

/// A model representing a single story card in the game.
///
/// This struct contains metadata and visual properties for a story card,
/// including the title, background color, completion percentage, and description.
struct StoryCard: Hashable {
    /// The title of the story displayed on the card.
    let title: String
    
    /// The background color associated with the story card for visual distinction.
    let color: Color
    
    /// The completion percentage of the story, ranging from 0% to 100%.
    let completion: Int
    
    /// Additional details or description of the story, providing context or backstory.
    let details: String
}

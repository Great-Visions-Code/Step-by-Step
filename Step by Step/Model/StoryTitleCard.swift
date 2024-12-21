//
//  StoryTitleCard.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import Foundation
import SwiftUI

/// Model representing a single story card in the game, containing metadata and visual properties.
struct StoryTitleCard: Hashable {
    /// The title of the story.
    let title: String
    
    /// The background color associated with the story card.
    let color: Color
    
    /// The completion percentage of the story, ranging from 0 to 100.
    let completion: Int
    
    /// Additional details or description of the story.
    let details: String
}

//
//  ChapterDecision.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/21/24.
//

import Foundation
import SwiftUI

/// Model representing a decision in a chapter, including tis description and the next chapter ID.
struct ChapterDecision {
    let decisionText: String
    /// The ID of the next chapter this decision leads to.
    let nextChapterID: Int?
}

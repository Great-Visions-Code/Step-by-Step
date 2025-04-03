//
//  AchievementCardItems.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 4/2/25.
//

import Foundation

/// A data structure that represents a single achievement's display-ready information.
///
/// This model is used to bridge the gap between raw achievement data and its formatted representation
/// in the UI. Each instance contains all necessary information to populate an `AchievementCardView`.
///
/// Conforms to `Identifiable` for use in SwiftUI's `ForEach`.
struct AchievementCardItems: Identifiable {
    /// A unique identifier for use in SwiftUI views.
    let id = UUID()

    /// The main title of the achievement (e.g., "10,000 Steps").
    let title: String

    /// A short description explaining the achievement requirement (e.g., "Walk 10,000 steps total").
    let description: String

    /// A flag indicating whether the achievement has been completed.
    let isCompleted: Bool

    /// The date the achievement was completed, if applicable.
    ///
    /// Should be formatted as a string suitable for UI display (e.g., "04/01/25").
    let dateEarned: String?

    /// Optional additional note for progress, shown only when the achievement is incomplete.
    ///
    /// Common usage includes showing how far the user is from unlocking it (e.g., "Steps to go: 3,000").
    let progressNote: String?
}

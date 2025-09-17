//
//  CardBackgroundView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 9/13/25.
//
import SwiftUI
/// A reusable **background view** for stat and navigation cards.
///
/// ### Purpose
/// - Acts as a **foundational building block**: provides the background layer,
///   while higher-level views (`StepsStatsCardView`, `CardNavigationView`) add content on top.
/// - Ensures all cards across the app share the same consistent background
///   style (color, opacity, rounded corners).
/// - Centralizes styling: pulls design constants from `AppStyle` so that
///   changes (e.g., corner radius or color) update globally.
///
/// ### Example Usage
/// ```swift
/// ZStack {
///     CardBackgroundView()
///     VStack { ... } // Card content
/// }
/// .frame(height: 120)
/// ```
///
/// ### Design Notes
/// - Uses a `Rectangle` with `clipShape(RoundedRectangle)` for flexibility:
///   this allows different shapes to be swapped in later if design evolves.
/// - Matches the card appearance used in `StatsView`, `CardNavigationView`,
///   and `StepsStatsCardView`.
struct CardBackgroundView: View {
    var body: some View {
        // MARK: - Background Rectangle
        Rectangle()
            .foregroundStyle(AppStyle.Card.backgroundColor)   // Pulls unified color from AppStyle
            .opacity(AppStyle.Card.backgroundOpacity)         // Adjustable opacity from AppStyle
            .clipShape(RoundedRectangle(cornerRadius: AppStyle.Card.cornerRadius)) // Consistent rounded corners
    }
}
// MARK: - SwiftUI Preview
#Preview {
    CardBackgroundView()
        .frame(height: 400) // Preview with fixed height for visualization
}

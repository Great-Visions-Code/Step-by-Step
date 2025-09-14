//
//  AppStyle.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 8/21/25.
//
import SwiftUI
/// `AppStyle` is a centralized place for storing reusable visual constants (tokens).
///
/// This helps keep styling consistent across the app and makes it easier to update
/// global design choices (like corner radius or colors) in one place rather than
/// searching through multiple files.
///
/// Example usage:
/// ```swift
/// RoundedRectangle(cornerRadius: AppStyle.cornerRadius)
///     .foregroundStyle(AppStyle.statsCardBackgroundColor)
///     .opacity(AppStyle.statsCardOpacity)
/// ```
enum AppStyle {
    
    // MARK: - General Use
    
    /// Default corner radius for cards, buttons, and containers.
    ///
    /// Matches modern iOS design language (iOS 16+),
    /// where corners are noticeably rounder than older versions.
    static let cornerRadius: CGFloat = 32
    
    // MARK: - Stats Views Styling
    
    /// Background color used for stat cards and other info panels.
    /// - Defined in your asset catalog (`Color.wave3`).
    static let statsCardBackgroundColor: Color = .wave3
    
    /// Default opacity to apply to stat card backgrounds.
    /// - Keeps the background slightly translucent so content feels layered.
    static let statsCardOpacity: Double = 0.25
}

#Preview("Stats View") {
    StatsView(
        stepTrackerViewModel: StepTrackerViewModel()
    )
}

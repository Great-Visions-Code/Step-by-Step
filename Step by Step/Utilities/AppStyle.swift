    //
    //  AppStyle.swift
    //  Step by Step
    //
    //  Created by Gustavo Vazquez on 8/21/25.
    //

    import SwiftUI

    /// `AppStyle` is a centralized **design system / style token container** for the app.
    ///
    /// ### Purpose
    /// - Provides a single source of truth for design constants (corner radius, colors, fonts, spacing).
    /// - Ensures consistent UI across views (`StatsView`, `AchievementsListView`, `CardNavigationView`, etc.).
    /// - Makes future design updates easier: change values here and they update app-wide.
    /// - Helps avoid "magic numbers" and inline styling scattered throughout the codebase.
    ///
    /// ### Example Usage
    /// ```swift
    /// RoundedRectangle(cornerRadius: AppStyle.Card.cornerRadius)
    ///     .foregroundStyle(AppStyle.Card.backgroundColor)
    ///     .opacity(AppStyle.Card.backgroundOpacity)
    /// ```
    ///
    /// ### How to Extend
    /// - Add new groups (`Spacing`, `Button`, `Graph`, etc.) as needed.
    /// - Keep related tokens together inside nested enums.
    /// - Use descriptive names so it’s clear where each style should be applied.
    ///
    /// ### Current Groups
    /// - `Card` → Styles for reusable card-like components
    /// - `Colors` → App-wide semantic color tokens
    /// - `Typography` → Fonts for titles, values, and sublabels
    enum AppStyle {
        
        // MARK: - Card Styling
        /// Shared style tokens for reusable **card-like** components,
        /// such as `StepsStatsCardView`, `CardNavigationView`, and `CardBackgroundView`.
        enum Card {
            /// Default corner radius applied to cards, buttons, and containers.
            ///
            /// - Matches modern iOS design language (iOS 16+),
            ///   where corners are noticeably rounder for a softer, friendlier look.
            /// - Helps maintain consistency across all card-based UI.
            static let cornerRadius: CGFloat = 32
            
            /// Background color used for stat/info cards.
            ///
            /// - Defined in the Asset Catalog as `Color.wave3`.
            /// - Keeps visual consistency across views (rather than using `.gray` or `.blue` directly).
            static let backgroundColor: Color = .wave3
            
            /// Default opacity applied to card backgrounds.
            ///
            /// - Creates a subtle, layered appearance instead of flat opaque blocks.
            /// - Lets background visuals (like `WaveBackground`) show through slightly.
            static let backgroundOpacity: Double = 0.25
            
            /// Default font for **section/card titles** (e.g., "Best Day", "7-Day Avg").
            /// - Usage: smaller, secondary emphasis text.
            static let titleFont: Font = .headline
            
            /// Default font for **stat values** (e.g., "14,115") and action oriented values like "View".
            /// - Usage: large numbers, main highlights, primary values.
            static let headlineFont: Font = .title3.bold()
        
            /// Default font for **secondary/subheadline text** (e.g., dates, progress notes).
            /// - Usage: metadata, completion dates, optional sublabels.
            static let subheadlineFont: Font = .caption
        }
        
        // MARK: - Colors
        /// Semantic color tokens used across the app.
        ///
        /// - Centralizing here allows for easy theme updates (e.g., light/dark mode tuning).
        /// - These colors should **describe purpose** (e.g., CTA, secondary text) instead of hard-coded names.
        enum Colors {
            /// Primary color for **call-to-action (CTA) elements**.
            /// - Example usage: "Continue" button, primary action highlights.
            static let ctaPrimary: Color = .blue
            
            /// Color for **secondary text** labels.
            /// - Example usage: subtitles, metadata, supporting labels.
            static let secondaryText: Color = Color(.secondaryLabel)
            
            /// Color for **primary text**.
            /// - Example usage: stat values, card titles, and main labels.
            static let primaryText: Color = Color(.label)
        }
        
        // MARK: - Typography
        /// Tokens specific to text styling across the app.
        ///
        /// - Primarily used in views like `StepsStatsCardView`, `CardNavigationView`, etc.
        /// - These are **role-based fonts** rather than hardcoded sizes.
        enum Typography {
            // MARK: Typography Tokens
            static let sectionTitleFont: Font = .headline
        }
    }

    // MARK: - SwiftUI Preview
    #Preview("Stats View") {
        StatsView(
            stepTrackerViewModel: StepTrackerViewModel()
        )
    }

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
    /// - Ensures consistent UI across views (`StatsView`, `AchievementsListView`, `NavigationCardView`, etc.).
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
    enum AppStyle {
        
        // MARK: - Card Styling
        /// Shared style tokens for reusable "card-like" components,
        /// such as `StepsStatsCardView`, `NavigationCardView`, and `StatsCardBackgroundView`.
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
        }
        
        // MARK: - Stats View Styling
        /// Tokens specific to `StatsView` and related components (`StepsStatsCardView`, `NavigationCardView`).
        enum StatsView {
            // MARK: Navigation Card Colors
            /// Font color for **navigation card titles**.
            ///
            /// - Uses system-provided `.secondaryLabel` for dynamic light/dark mode support.
            /// - Best for secondary/emphasis text such as section titles or sublabels.
            static let titleFontColor: Color = Color(.secondaryLabel)
            
            /// Font color for **navigation card values** (the main highlighted number or text).
            ///
            /// - Uses system-provided `.label` for strong readability in both light and dark modes.
            /// - Applied to primary values (e.g., "14,115", "View").
            static let valueFontColor: Color = Color(.label)
            
            // MARK: Typography Tokens
            /// Default font for **section/card titles** (e.g., "Best Day", "7-Day Avg").
            static let titleFont: Font = .headline
            
            /// Default font for **stat values** (e.g., "14,115").
            static let valueFont: Font = .title3
            
            /// Default font for **secondary/subheadline text** (e.g., dates, progress notes).
            static let subheadlineFont: Font = .caption
        }
    }

    // MARK: - SwiftUI Preview
    #Preview("Stats View") {
        StatsView(
            stepTrackerViewModel: StepTrackerViewModel()
        )
    }

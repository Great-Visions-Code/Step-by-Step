    //
    //  AppStyle.swift
    //  Step by Step
    //
    //  Created by Gustavo Vazquez on 8/21/25.
    //

    import SwiftUI

    /// `AppStyle` is a centralized **design system / style token container** for the app.
    ///
    /// ## Responsibilities
    /// - Acts as the single source of truth for app-wide visual tokens (corner radii, colors, fonts).
    /// - Enables consistent UI across views (`StatsView`, `AchievementsListView`, `CardNavigationView`, etc.).
    ///
    /// ## Design
    /// - Organized into semantic nested groups (`Card`, `Colors`, `Typography`) so usage sites are self-documenting.
    /// - Tokens are **role-based** (e.g., `ctaPrimary`, `sectionTitleFont`) rather than tied to numeric sizes or hard colors.
    ///
    /// ## Ownership & State
    /// - Pure value namespace (no state). Safe to access from any thread, but apply tokens on the main thread when updating UI.
    ///
    /// ## Accessibility
    /// - Colors rely on system-provided variants (`.label`, `.secondaryLabel`) to respect Light/Dark Mode and contrast settings.
    /// - Fonts are semantic (`.headline`, `.title3`, `.caption`) to work with Dynamic Type scaling.
    ///
    /// > Important: Treat these as **tokens**. If you need a new role (e.g., a warning chip), add a new semantic token
    /// rather than reusing an unrelated one.
    ///
    /// ### Example Usage
    /// ```swift
    /// RoundedRectangle(cornerRadius: AppStyle.Card.cornerRadius)
    ///     .foregroundStyle(AppStyle.Card.backgroundColor)
    ///     .opacity(AppStyle.Card.backgroundOpacity)
    /// ```
    ///
    /// ### How to Extend
    /// - Add new groups (`Spacing`, `Button`, `Graph`, etc.) as needs emerge.
    /// - Keep names role-based and descriptive.
    /// - Prefer system colors and fonts for accessibility unless brand constraints require custom assets.
    ///
    /// ### Current Groups
    /// - `Card` → Styles for reusable card-like components
    /// - `Colors` → App-wide semantic color tokens
    /// - `Typography` → Fonts for titles, values, and sublabels
    enum AppStyle {
        
        // MARK: - Card Styling
        /// Shared style tokens for reusable **card-like** components,
        /// such as `StepsStatsCardView`, `CardNavigationView`, and `CardView`.
        enum Card {
            /// Default corner radius applied to cards, buttons, and containers.
            ///
            /// - Rationale: Matches modern iOS design language (iOS 16+), which favors rounder corners
            ///   for a softer, friendlier look. Keeping this here ensures consistency everywhere.
            static let cornerRadius: CGFloat = 32
            
            /// Background color used for stat/info cards.
            ///
            /// - Defined in the Asset Catalog as `Color.wave3`.
            /// - Centralizing avoids ad-hoc usage of `.gray` or `.blue`, which can break theme consistency.
            static let backgroundColor: Color = .wave3
            
            /// Default opacity applied to card backgrounds.
            ///
            /// - Creates a subtle, layered appearance instead of flat opaque blocks.
            /// - Lets background visuals (like `WaveBackground`) show through slightly.
            static let backgroundOpacity: Double = 0.25
            
            /// Default font for **section/card titles** (e.g., "Today's Steps").
            ///
            /// - Role: Smaller, secondary-emphasis text used as a section or card title.
            /// - A11y: Semantic text style to respect Dynamic Type.
            static let titleFont: Font = .headline
            
            /// Default font for subheads within card layouts (e.g., "Best Day", "7-Day Avg")..
            ///
            /// - Role: One step below headline for supportive labels.
            static let subtitleFont: Font = .subheadline

            /// Default font for primary stat numbers displayed within cards.
            ///
            /// - Role: The “stat” value (e.g., “3.42 mi”). Bold to provide strong emphasis.
            /// - Note: Keep labels readable under large Dynamic Type; prefer truncation or scaling if needed.
            static let statFont: Font = .title3.bold()
            
            /// Default font for small supporting values, captions, or metadata within cards (e.g., "Current 1").
            static let subStatFont: Font = .caption

            /// Default font for prominent call-to-action text within a card context.
            ///
            /// - Example: “Continue”, “Convert”, “View”, "Done".
            static let ctaFont: Font = .title3.bold()
        }
        
        // MARK: - Colors
        /// Semantic color tokens used across the app.
        ///
        /// - Centralizing here allows for easy theme updates (e.g., light/dark tuning).
        /// - Tokens should **describe purpose** (e.g., CTA, secondary text) rather than hard-coded names.
        enum Colors {
            /// Color for **secondary text** labels.
            ///
            /// - Example: Subtitles, metadata, supporting labels.
            /// - A11y: System-managed contrast via `.secondaryLabel`.
            static let secondaryText: Color = Color(.secondaryLabel)
            
            /// Color for **primary text**.
            ///
            /// - Example: Stat values, card titles, and main labels.
            /// - A11y: System-managed contrast via `.label`.
            static let primaryText: Color = Color(.label)
        }
        
        // MARK: - Typography
        /// Tokens specific to text styling across the app.
        ///
        /// - Used in views like `StepsStatsCardView`, `CardNavigationView`, etc.
        /// - These are **role-based fonts** rather than hard-coded sizes to better support Dynamic Type.
        enum Typography {
            /// Default font for **section titles** across screens.
            ///
            /// - Example: “Steps in a Day", “Story Achievements”.
            /// - Rationale: Using semantic text styles keeps scaling consistent and predictable.
            static let sectionTitleFont: Font = .headline
        }
    }

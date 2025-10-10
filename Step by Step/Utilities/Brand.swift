//
//  Brand.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/8/25.
//

import Foundation

/// App-wide brand constants and convenience helpers.
///
/// ## Responsibilities
/// - Provide a single source of truth for brand strings (app name, company, support email).
/// - Offer a stable **subject prefix** for outbound emails / logs that includes the current app name.
/// - Read the display name from the bundle so TestFlight / debug builds show the correct title.
///
/// ## Design
/// - Pure value namespace—no state or side effects. Safe to reference anywhere.
/// - `appDisplayName` gracefully falls back: `CFBundleDisplayName` → `CFBundleName` → `"Step by Step"`.
///
/// ## Ownership & State
/// - Values are derived from the main bundle at runtime; there is no retained state here.
/// - Callers do not mutate these values (all `static let` except a computed prefix).
///
/// ## Maintenance Notes
/// - Keep these strings neutral and **localization-ready**. If you localize the app name, the
///   `CFBundleDisplayName` entry in the Info.plist’s localized variants will flow through here.
/// - If you add more brand assets (URLs, social handles), prefer semantic names (e.g., `supportURL`).
/// - Consider moving secrets or environment-specific values to a build configuration rather than hardcoding.
///
/// > Note: Only **non-sensitive** values should live here. Do not place API keys or secrets in source.
///
enum Brand {
    
    // MARK: - App Display Name
    
    /// The user-facing app name, derived from the bundle with sensible fallbacks.
    ///
    /// Resolution order:
    /// 1. `CFBundleDisplayName` (preferred, localized)
    /// 2. `CFBundleName`
    /// 3. `"Step by Step"` (hardcoded fallback to remain robust in unit tests / previews)
    ///
    /// - Rationale: Using Info.plist keeps previews/TestFlight matching the installed binary’s name.
    static let appDisplayName: String = (
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
        Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ??
        "Step by Step"
    )
    
    // MARK: - Organization
    
    /// The developer / publisher name shown in Settings and About screens.
    /// - TODO(gustavo): Localize if you plan to localize brand strings; otherwise keep as a proper noun.
    static let companyName = "Great-Visions-Code"
    
    /// Support inbox for user emails (e.g., bug reports, feedback).
    /// - Important: Ensure this mailbox is monitored and has sufficient quota.
    /// - TODO(gustavo): Consider environment-specific addresses (e.g., staging vs. production) via build configs.
    static let supportEmail = "great.visions@icloud.com"
    
    // MARK: - Helpers
    
    /// A standardized subject prefix for outbound messages.
    ///
    /// Example:
    /// ```swift
    /// let subject = "\(Brand.subjectPrefix) Bug: Crash on step import"
    /// // "[Step by Step] Bug: Crash on step import"
    /// ```
    /// - Returns: A bracketed prefix containing the resolved `appDisplayName`.
    static var subjectPrefix: String { "[\(appDisplayName)]" }
}

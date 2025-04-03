//
//  Formatters.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 4/2/25.
//

import Foundation

// MARK: - Numeric Formatters

/// Extension to format `Int` values into human-readable strings with comma separators.
extension Int {
    /// Formats the integer using the system's locale with comma grouping.
    ///
    /// Example:
    /// ```swift
    /// let steps = 10000
    /// print(steps.formatted()) // "10,000"
    /// ```
    ///
    /// - Returns: A string representation of the integer with commas.
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

/// Extension to format `Double` values into clean, human-readable strings.
extension Double {
    /// Formats the double using commas and conditionally shows decimal places.
    ///
    /// - If the value is a whole number, it shows no decimal (e.g., `"1,000"`).
    /// - If the value includes a fraction, it shows one decimal place (e.g., `"1,234.5"`).
    ///
    /// Example:
    /// ```swift
    /// let distance: Double = 1234.5
    /// print(distance.formattedWithCommas()) // "1,234.5"
    /// ```
    ///
    /// - Returns: A string with comma formatting and appropriate precision.
    func formattedWithCommas() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = self == floor(self) ? 0 : 1
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

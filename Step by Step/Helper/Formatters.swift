//
//  Formatters.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 4/2/25.
//

import Foundation

// MARK: - Formatters
extension Int {
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

extension Double {
    func cleanMiles() -> String {
        self == floor(self) ? String(format: "%.0f", self) : String(format: "%.1f", self)
    }
}

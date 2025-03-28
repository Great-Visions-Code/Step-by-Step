//
//  PlayerStats.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/18/24.
//

import Foundation

/// A structure that represents the player's statistics within the game.
///
/// `PlayerStats` tracks two primary attributes:
/// - `health`: A value representing the player's life or endurance.
/// - `energy`: A resource used to perform actions within the game.
///
/// Both values are capped between `0` and `10` to ensure valid bounds
/// and maintain game balance.
struct PlayerStats {
    
    // MARK: - Properties

    /// The player’s current health value.
    ///
    /// Health is capped between `0` (no health) and `10` (maximum health).
    var health: Int

    /// The player’s current energy value.
    ///
    /// Energy is capped between `0` (exhausted) and `10` (fully energized).
    var energy: Int

    // MARK: - Health Management

    /// Reduces the player’s health by a specified amount.
    ///
    /// If the resulting health would drop below `0`, it is capped to `0`.
    ///
    /// - Parameter amount: The number of health points to subtract.
    mutating func decreaseHealth(by amount: Int) {
        health = max(health - amount, 0)
    }

    /// Increases the player’s health by a specified amount.
    ///
    /// If the resulting health would exceed `10`, it is capped to `10`.
    ///
    /// - Parameter amount: The number of health points to add.
    mutating func increaseHealth(by amount: Int) {
        health = min(health + amount, 10)
    }

    // MARK: - Energy Management

    /// Reduces the player’s energy by a specified amount.
    ///
    /// If the resulting energy would drop below `0`, it is capped to `0`.
    ///
    /// - Parameter amount: The number of energy points to subtract.
    mutating func decreaseEnergy(by amount: Int) {
        energy = max(energy - amount, 0)
    }

    /// Increases the player’s energy by a specified amount.
    ///
    /// If the resulting energy would exceed `10`, it is capped to `10`.
    ///
    /// - Parameter amount: The number of energy points to add.
    mutating func increaseEnergy(by amount: Int) {
        energy = min(energy + amount, 10)
    }
}

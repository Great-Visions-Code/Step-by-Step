//
//  PlayerStats.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/18/24.
//

import Foundation

/// Model representing the player's statistics in the game.
///
/// Tracks and manages the player's current health and energy points
/// with safeguards to ensure values stay within valid ranges.
struct PlayerStats {
    /// The current health points of the player, ranging 0 to 10.
    var health: Int
    
    /// The current energy points of the player, ranging from 0 to 10.
    var energy: Int
    
    // MARK: - Health Management
    
    /// Decreases the player's health by a specified amount.
    ///
    /// Ensures that health cannot drop below 0.
    /// -  Parameter amount: The amount to decrease health by.
    mutating func decreaseHealth(by amount: Int) {
        health = max(health - amount, 0)
    }
    
    /// Increases the player's health by a specified amount.
    ///
    /// Ensures that health does not exceed the maximum of 10.
    /// - Parameter amount: The amount to increase health by.
    mutating func increaseHealth(by amount: Int) {
        health = min(health + amount, 10)
    }
    
    // MARK: - Energy Management
    
    /// Decreases the player's energy by a specified amount.
    ///
    /// Ensures that energy cannot drop below 0.
    /// - Parameter amount: The amount to decrease energy by.
    mutating func decreaseEnergy(by amount: Int) {
        energy = max(energy - amount, 0)
    }
    
    /// Increases the players's energy by a specified amount.
    ///
    /// Ensures that energy does not exceed the maximum of 10.
    /// - Parameter amount: The amount to increase energy by.
    mutating func increaseEnergy(by amount: Int) {
        energy = min(energy + amount, 10)
    }
}

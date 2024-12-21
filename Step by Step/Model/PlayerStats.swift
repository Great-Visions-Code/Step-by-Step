//
//  PlayerStats.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/18/24.
//

import Foundation
import SwiftUI

/// Model representing the player's statistics in the game, including health and energy.
struct PlayerStats {
    /// The current health points of the player.
    var health: Int
    
    /// The current energy points of the player.
    var energy: Int
    
    /**
     Decreases the player's health by a specified amount.
     
     - Parameter amount: The amount to decrease health by.
     - Note: Health cannot drop below 0.
     */
    mutating func decreaseHealth(by amount: Int) {
        health = max(health - amount, 0) // Ensure health does not go below 0.
    }
    
    /**
     Increases the player's health by a specified amount.
     
     - Parameter amount: The amount to increase health by.
     - Note: Health is capped at 10.
     */
    mutating func increaseHealth(by amount: Int) {
        health = min(health + amount, 10) // Ensure health does not exceed 10.
    }
    
    /**
     Decreases the player's energy by a specified amount.
     
     - Parameter amount: The amount to decrease energy by.
     - Note: Energy cannot drop below 0.
     */
    mutating func decreaseEnergy(by amount: Int) {
        energy = max(energy - amount, 0) // Ensure energy does not go below 0.
    }
    
    /**
     Increases the player's energy by a specified amount.
     
     - Parameter amount: The amount to increase energy by.
     - Note: Energy is capped at 10.
     */
    mutating func increaseEnergy(by amount: Int) {
        energy = min(energy + amount, 10) // Ensure energy does not exceed 10.
    }
}

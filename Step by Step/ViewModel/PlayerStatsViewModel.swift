//
//  PlayerStatsViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/17/24.
//

import SwiftUI

/// ViewModel responsible for managing the player's stats (health and energy points) in the app.
///
/// This ViewModel ensures reactive updates to views observing player stats, such as health and energy points.
/// It provides methods to modify these stats safely while adhering to defined constraints (e.g., health and energy capping).
class PlayerStatsViewModel: ObservableObject {
    /// Published player stats model containing health and energy points.
    ///
    /// Changes to this property trigger UI updates in any observing views.
    /// The `private(set)` access ensures external code can only read, not modify, this property directly.
    @Published private(set) var playerStats: PlayerStats
    
    /// Initializes the ViewModel with default or custom values for health and energy points.
    ///
    /// - Parameters:
    ///   - health: The player's initial health value (default is 10).
    ///   - energy: The player's initial energy value (default is 0).
    init(health: Int = 10, energy: Int = 0) {
        self.playerStats = PlayerStats(
            health: health,
            energy: energy
        )
    }
    
    // MARK: - Health and Energy Management
    
    /// Applies changes to the player's health and energy.
    ///
    /// Adjusts health and energy points based on the provided values (positive or negative).
    /// Ensures that stats remain within their defined bounds (e.g., health cannot exceed 10 or drop below 0).
    /// Triggers UI updates by reassigning the `playerStats` property.
    ///
    /// - Parameters:
    ///   - HPChange: The amount to adjust health by.
    ///   - EPChange: The amount to adjust energy by.
    func applyStatChanges(HPChange: Int, EPChange: Int) {
        // Create a mutable copy of the current player stats to apply changes safely.
        var updatedStats = playerStats

        // Apply the health change.
        if HPChange < 0 {
            updatedStats.decreaseHealth(by: abs(HPChange))
        } else {
            updatedStats.increaseHealth(by: HPChange)
        }

        // Apply the energy change.
        if EPChange < 0 {
            updatedStats.decreaseEnergy(by: abs(EPChange))
        } else {
            updatedStats.increaseEnergy(by: EPChange)
        }

        // Update the published property to trigger SwiftUI updates.
        playerStats = updatedStats
    }
    
    // MARK: - Health Management
    
    /// Decreases the player's health by a specified amount, ensuring it doesn't drop below 0.
    /// - Parameter amount: The amount to decrease the health by.
    func decreaseHealth(by amount: Int) {
        playerStats.decreaseHealth(by: amount)
    }
    
    /// Increases the player's health by a specified amount, ensuring it doesn't exceed the maximum value of 10.
    /// - Parameter amount: The amount to increase the health by.
    func increaseHealth(by amount: Int) {
        playerStats.increaseHealth(by: amount)
    }
    
    /// Resets the player's health to its default value of 10 health points.
    ///
    /// This method is typically used to reset health points at the start of a new game or after a key milestone.
    func resetHealth() {
        var updatedStats = playerStats
        updatedStats.health = 10
        playerStats = updatedStats
    }

    // MARK: - Energy Management
        
    /// Decreases the player's energy by a specified amount, ensuring it doesn't drop below 0.
    /// - Parameter amount: The amount to decrease the energy by.
    func decreaseEnergy(by amount: Int) {
        playerStats.decreaseEnergy(by: amount)
    }
    
    /// Increases the player's energy by a specified amount, ensuring it doesn't exceed the maximum value of 10.
    /// - Parameter amount: The amount to increase the energy by.
    func increaseEnergy(by amount: Int) {
        playerStats.increaseEnergy(by: amount)
    }
    
    /// Updates the player's energy to a new value, ensuring it doesn't exceed the maximum value of 10.
    /// - Parameter newEnergy: The new energy value to set.
    func updateEnergy(to newEnergy: Int) {
        playerStats.energy = min(newEnergy, 10)
    }
}

//
//  PlayerStatsViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/17/24.
//

import SwiftUI

/// ViewModel responsible for managing the player's stats (health and energy) in the app.
class PlayerStatsViewModel: ObservableObject {
    /// Published player stats model containing health and energy.
    /// The `private(set)` access ensures that the stats can only be modified through this view model's methods.
    @Published private(set) var playerStats: PlayerStats
    
    /// Initializes the view model with default or custom values for health and energy.
    /// - Parameters:
    ///   - health: The player's initial health value (default is 10).
    ///   - energy: The player's initial energy value (default is 0).
    init(health: Int = 10, energy: Int = 2) {
        self.playerStats = PlayerStats(
            health: health,
            energy: energy
        )
    }
    
    // MARK: - Health and Energy Management.
    
    /// Applies changes to the player's health and energy.
    ///
    /// This function adjusts the player's health and energy based on the provided values.
    /// It handles both positive and negative changes, ensuring that updates are reflected across the app by reassigning the `playerStats` property to trigger SwiftUI updates.
    ///
    /// - Parameters:
    ///   - HPChange: The amount to adjust health by.
    ///   - EPChange: The amount to adjust energy by.
    func applyStatChanges(HPChange: Int, EPChange: Int) {
        // Create a mutable copy of the current player stats.
        // This ensures that modifications do not directly mutate the published property until explicitly reassigned.
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

        // Reassign the updated stats back to the `playerStats` property.
        // This triggers SwiftUI to refresh any views observing this property.
        playerStats = updatedStats
    }
    
    // MARK: - HP Individual Stat Management.
    
    /// Decreases the player's health by a specified amount, ensuring it doesn't drop below zero.
    /// - Parameter amount: The amount to decrease the health by.
    func decreaseHealth(by amount: Int) {
        playerStats.decreaseHealth(by: amount)
    }
    
    /// Increases the player's health by a specified amount, ensuring it doesn't exceed the maximum (10).
    /// - Parameter amount: The amount to increase the health by.
    func increaseHealth(by amount: Int) {
        playerStats.increaseHealth(by: amount)
    }
    
    /// Resets the player's health to full (default: 10 health points).
    /// This method reassigns the `health` property to its maximum value and triggers SwiftUI updates.
    func resetHealth() {
        var updatedStats = playerStats
        updatedStats.health = 10
        playerStats = updatedStats
    }

    // MARK: - EP Individual Stat Management.
        
    /// Decreases the player's energy by a specified amount, ensuring it doesn't drop below zero.
    /// - Parameter amount: The amount to decrease the energy by.
    func decreaseEnergy(by amount: Int) {
        playerStats.decreaseEnergy(by: amount)
    }
    
    /// Increases the player's energy by a specified amount, ensuring it doesn't exceed the maximum (10).
    /// - Parameter amount: The amount to increase the energy by.
    func increaseEnergy(by amount: Int) {
        playerStats.increaseEnergy(by: amount)
    }
    
    /// Updates the player's energy to a new value, ensuring it doesn't exceed the maximum (10).
    /// - Parameter newEnergy: The new energy value to set.
    func updateEnergy(to newEnergy: Int) {
        playerStats.energy = min(newEnergy, 10)
    }
}

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
    
    /// Keys for persisting energy and last reset date.
    private static let energyKey = "playerEnergy"
    private static let lastResetDateKey = "lastEnergyResetDate"
    
    /// Initializes the ViewModel with persisted values for energy and default health.
    ///
    /// - Parameters:
    ///   - health: The player's initial health value (default is 10).
    init(health: Int = 10) {
        let savedEnergy = PlayerStatsViewModel.loadEnergy() // Load saved energy
        self.playerStats = PlayerStats(
            health: health,
            energy: savedEnergy
        )
        
        checkAndResetEnergyAtMidnight() // Ensures energy resets daily
    }
    
    // MARK: - Energy Persistence
    
    /// Saves the current energy value persistently.
    ///
    /// - Parameter energy: The player's updated energy value.
    private static func saveEnergy(_ energy: Int) {
        UserDefaults.standard.set(energy, forKey: energyKey)
    }
    
    /// Loads the persisted energy value.
    ///
    /// - Returns: The saved energy value or 0 if no value exists.
    private static func loadEnergy() -> Int {
        return UserDefaults.standard.integer(forKey: energyKey)
    }
    
    private func checkAndResetEnergyAtMidnight() {
        let lastResetDate = UserDefaults.standard.object(forKey: Self.lastResetDateKey) as? Date ?? Date.distantPast
        let calendar = Calendar.current
        
        if !calendar.isDate(lastResetDate, inSameDayAs: Date()) {
            playerStats.energy = 0
            PlayerStatsViewModel.saveEnergy(0) // Reset value in storage
            UserDefaults.standard.set(Date(), forKey: Self.lastResetDateKey) // Save new reset date
            print("🔁 Energy reset at midnight")
        }
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
        
        // Save the new energy value persistently
        PlayerStatsViewModel.saveEnergy(updatedStats.energy)

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
        PlayerStatsViewModel.saveEnergy(playerStats.energy) // Persist the change
    }
    
    /// Increases the player's energy by a specified amount, ensuring it doesn't exceed the maximum value of 10.
    /// - Parameter amount: The amount to increase the energy by.
    func increaseEnergy(by amount: Int) {
        playerStats.increaseEnergy(by: amount)
        PlayerStatsViewModel.saveEnergy(playerStats.energy) // Persist the change
    }
    
    /// Updates the player's energy to a new value, ensuring it doesn't exceed the maximum value of 10.
    /// - Parameter newEnergy: The new energy value to set.
    func updateEnergy(to newEnergy: Int) {
        playerStats.energy = min(newEnergy, 10)
        PlayerStatsViewModel.saveEnergy(playerStats.energy) // Persist the change
    }
}

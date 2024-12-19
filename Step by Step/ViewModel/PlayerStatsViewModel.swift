//
//  PlayersStatsViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/17/24.
//

import SwiftUI

class PlayerStatsViewModel: ObservableObject {
    @Published private(set) var playerStats: PlayerStats
    
    // Initialize with default values
    init(health: Int = 9, energy: Int = 0) {
        self.playerStats = PlayerStats(
            health: health,
            energy: energy
        )
    }
    
    // Method to decrease health
    func decreaseHealth(by amount: Int) {
        playerStats.decreaseHealth(by: amount)
    }
    
    // Method to increase health
    func increaseHealth(by amount: Int) {
        playerStats.increaseHealth(by: amount)
    }
    
    func updateEnergy(to newEnergy: Int) {
        playerStats.energy = min(newEnergy, 10)
    }
}

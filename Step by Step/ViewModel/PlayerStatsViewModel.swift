//
//  PlayersStatsViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/17/24.
//

import SwiftUI

class PlayerStatsViewModel: ObservableObject {
    @Published var currentHealthPoints: Int
    @Published var currentEnergyPoints: Int
    
    // Default values
    init(health: Int = 9, energy: Int = 0) {
        self.currentHealthPoints = health
        self.currentEnergyPoints = energy
    }
    
    // Method to decrease health
    func decreaseHealth(by amount: Int) {
        currentHealthPoints = max(currentHealthPoints - amount, 0)
    }
    
    // Method to increase health
    func increaseHealth(by amount: Int) {
        currentHealthPoints = min(currentHealthPoints + amount, 10)
    }
}

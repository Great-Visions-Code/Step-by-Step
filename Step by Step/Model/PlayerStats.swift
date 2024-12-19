//
//  PlayerStats.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/18/24.
//

import Foundation
import SwiftUI

struct PlayerStats {
    var health: Int
    var energy: Int
    
    // Ensure values stay within bounds
    mutating func decreaseHealth(by amount: Int) {
        health = max(health - amount, 0)
    }
    
    mutating func increaseHealth(by amount: Int) {
        health = min(energy + amount, 100)
    }
}

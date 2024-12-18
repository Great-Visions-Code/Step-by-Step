//
//  CurrentEnergyProgressView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

struct CurrentEnergyProgressView: View {
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    var body: some View {
        Text("Current Energy: \(playerStatsViewModel.currentEnergyPoints)")
            .font(.headline)
            .padding(.top)
    }
}

#Preview {
    let playerStatsViewModel = PlayerStatsViewModel()
    
    return CurrentEnergyProgressView(
        playerStatsViewModel: playerStatsViewModel
    )
}

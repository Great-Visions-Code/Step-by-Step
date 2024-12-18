//
//  PlayerStatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

struct PlayerStatsView: View {
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    var body: some View {
        HStack {
            HStack(spacing: 5) {
                // MARK: currentHealthPoints (HP)
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                Text("\(playerStatsViewModel.currentHealthPoints) / 10")
                    .font(.headline)
            }
            Spacer()
            HStack(spacing: 5) {
                // MARK: currentEnergyPoints (EP)
                Image(systemName: "bolt.fill")
                    .foregroundStyle(.blue)
                Text("\(playerStatsViewModel.currentEnergyPoints) / 10")
                    .font(.headline)
            }
            Spacer()
            // MARK: Day Count
            Text("Day 1 out of 10")
                .font(.headline)
        }
        .padding([.leading, .trailing])    }
}

#Preview {
    PlayerStatsView(
        playerStatsViewModel: PlayerStatsViewModel()
    )
}

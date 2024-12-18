//
//  PlayerStatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

struct PlayerStatsView: View {
    var currentEnergyPoints: Int
    
    var body: some View {
        HStack {
            HStack(spacing: 5) {
                // MARK: HP
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                // NOTE: Placeholder for dynamic HP
                Text("10 / 10")
                    .font(.headline)
            }
            Spacer()
            HStack(spacing: 5) {
                // MARK: EP
                Image(systemName: "bolt.fill")
                    .foregroundStyle(.blue)
                Text("\(currentEnergyPoints) / 10")
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
        currentEnergyPoints: 5
    )
}

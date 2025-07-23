//
//  CurrentEnergyProgressView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

struct CurrentEnergyProgressView: View {
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    private let maxEnergy = 10.0          // keeps the magic number central
    
    var body: some View {
        VStack(spacing: 12) {
//            Text("Energy Reserves")
//                .font(.headline)
//                .bold()
            HStack{
                Image(systemName: "bolt.fill")
                Text("Reserves")
                    .font(.title2)
            }
            
            HStack(spacing: 20) {
                ProgressView(
                    value: Double(playerStatsViewModel.playerStats.energy),
                    total: maxEnergy
                )
                .progressViewStyle(.linear)                 // iOS 14+ linear bar
                .tint(.blue)                               // optional brand colour
                .frame(height: 4)                          // makes the bar thicker
                .clipShape(Capsule())                       // rounded ends
                .animation(.easeInOut(duration: 0.35),      // smooth fill change
                           value: playerStatsViewModel.playerStats.energy)
                
                Text("\(playerStatsViewModel.playerStats.energy)/\(Int(maxEnergy))")
            }
        }
    }
}

#Preview {
    let vm = PlayerStatsViewModel()
    vm.updateEnergy(to: 5)
    return CurrentEnergyProgressView(playerStatsViewModel: vm)
}

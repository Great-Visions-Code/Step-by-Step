//
//  PlayerStatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

struct PlayerStatsView: View {
    var body: some View {
        HStack {
            HStack(spacing: 5) {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                // NOTE: Placeholder for dynamic HP
                Text("10 / 10")
                    .font(.headline)
            }
            Spacer()
            HStack(spacing: 5) {
                Image(systemName: "bolt.fill")
                    .foregroundStyle(.blue)
                // NOTE: Placeholder for dynamic EP
                Text("10 / 10")
                    .font(.headline)
            }
            Spacer()
            // NOTE: Placeholder for dynamic story day
            Text("Day 1 out of 10")
                .font(.headline)
        }
        .padding([.leading, .trailing])    }
}

#Preview {
    PlayerStatsView()
}

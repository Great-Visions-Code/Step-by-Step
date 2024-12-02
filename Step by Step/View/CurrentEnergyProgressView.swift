//
//  CurrentEnergyProgressView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

struct CurrentEnergyProgressView: View {
    // Variable to be passed in DashboardView.swift
    var currentEnergyPoints: Int
    
    var body: some View {
        Text("Current Energy: \(currentEnergyPoints)")
            .font(.headline)
            .padding(.top)
    }
}

#Preview {
    CurrentEnergyProgressView(
        // Sample data
        currentEnergyPoints: 5
    )
}

//
//  StepsTakenStatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

struct StepsTakenStatsView: View {
    @Environment(\.colorScheme) var colorScheme // Detect system theme

    var body: some View {
        // MARK: - Steps & 7-Day Average
        VStack(spacing: 8) {
            Text("STEPS")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("237")
                .font(.system(size: 50, weight: .bold))
            
            HStack {
                Text("7-DAY AVERAGE")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text("2,942")
                    .font(.subheadline)
                    .bold()
            }
            .padding(.top, 4)
        }
        .padding()
        
        // MARK: - Distance & Goal Progress
        HStack(spacing: 16) {
            StepsCardStatsView(title: "DISTANCE", value: "0.1 mi", colorScheme: colorScheme)
            StepsCardStatsView(title: "GOAL PROGRESS", value: "2%", colorScheme: colorScheme)
        }
        .padding(.bottom, 50)
    }
}

#Preview {
    StepsTakenStatsView()
}

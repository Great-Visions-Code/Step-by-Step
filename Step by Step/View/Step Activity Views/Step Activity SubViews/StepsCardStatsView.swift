//
//  StepsCardStatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// **Reusable Stat Box**
struct StepsCardStatsView: View {
    var title: String
    var value: String
    var colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(value)
                .font(.title3)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(colorScheme == .dark ? Color(.systemGray6) : Color.white) // Adapts to dark mode
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    StepsCardStatsView(
        title: "DISTANCE",
        value: "1.3 mi",
        colorScheme: .light)
    
    StepsCardStatsView(
        title: "GOAL PROGRESS",
        value: "2%",
        colorScheme: .light)
}

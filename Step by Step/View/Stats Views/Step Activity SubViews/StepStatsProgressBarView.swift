//
//  StepStatsProgressBarView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// **Reusable Bar View for Step Data**
struct StepStatsProgressBarView: View {
    var value: Int
    var label: String
    var isToday: Bool = false
    var maxValue: Int
    var maxHeight: CGFloat

    var body: some View {
        VStack {
            // Step count with dynamic font scaling
            Text("\(value)")
                .font(.system(size: 16, weight: .bold)) // Default size
                .minimumScaleFactor(0.7) // Allows it to shrink if needed
                .lineLimit(1) // Prevents multiple lines
                .frame(width: 40) // Ensures width consistency
                .foregroundStyle(isToday ? Color.blue : Color.primary)

            // Bar representation of steps
            RoundedRectangle(cornerRadius: 5)
                .fill(isToday ? Color.blue.opacity(0.8) : Color.blue.opacity(0.6))
                .frame(
                    width: 35,
                    height: maxHeight * CGFloat(value) / CGFloat(maxValue)
                )

            // Day label with dynamic font scaling
            Text(label)
                .font(.system(size: 12, weight: .medium)) // Default size
                .minimumScaleFactor(0.7) // Allows it to shrink if needed
                .lineLimit(1) // Prevents wrapping
                .frame(width: 40) // Ensures consistent width
                .foregroundStyle(isToday ? Color.blue : .gray)
        }
    }
}

#Preview {
    StepStatsProgressBarView(
        value: 5000,
        label: "Mon",
        maxValue: 2094,
        maxHeight: 200
    )
}

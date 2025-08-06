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
                .font(.subheadline)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.5) // Allows it to shrink if needed
                .lineLimit(1) // Prevents multiple lines
                .frame(width: 40) // Ensures width consistency
                .foregroundStyle(isToday ? Color.blue : Color.primary)

            // Bar representation of steps
            RoundedRectangle(cornerRadius: 5)
                .fill(isToday ? Color.blue.opacity(0.95) : Color.blue.opacity(0.75))
                .frame(
                    width: 35,
                    height: maxHeight * CGFloat(value) / CGFloat(maxValue)
                )

            // Day label with dynamic font scaling
            Text(label)
                .font(.caption)
                .minimumScaleFactor(0.6) // Allows it to shrink if needed
                .lineLimit(1) // Prevents wrapping
                .frame(width: 40) // Ensures consistent width
                .foregroundStyle(isToday ? Color.blue : .secondary)
        }
    }
}

#Preview {
    StepStatsProgressBarView(
        value: 5000,
        label: "8/2/25",
        maxValue: 2094,
        maxHeight: 200
    )
}

//
//  StepStatsGraphView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

struct StepStatsGraphView: View {
    var body: some View {
        // MARK: - Bar Chart
        VStack {
            HStack(alignment: .bottom, spacing: 12) {
                StepStatsProgressBarView(value: 1143, label: "Mon")
                StepStatsProgressBarView(value: 4060, label: "Tue")
                StepStatsProgressBarView(value: 3692, label: "Wed")
                StepStatsProgressBarView(value: 4292, label: "Thu")
                StepStatsProgressBarView(value: 3716, label: "Fri")
                StepStatsProgressBarView(value: 469, label: "Sat")
                StepStatsProgressBarView(value: 237, label: "Sun", isToday: true)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    StepStatsGraphView()
}

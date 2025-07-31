//
//  StatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/14/25.
//

import SwiftUI

/// Displays a user's step activity breakdown including current stats and historical graph.
///
/// Combines both the current day's summary via `StepsTakenStatsView` and the multi-day bar chart
/// via `StepStatsGraphView`. Used within the Achievements tab to provide users with insight into
/// their walking patterns and overall progress.
struct StatsView: View {
    var body: some View {
        VStack {
            // MARK: - Daily Step Summary
            // Displays today's step count, distance, and goal progress percentage
            StepsTakenStatsView(
                stepTrackerViewModel: StepTrackerViewModel()
            )

            // MARK: - Step History Graph
            // Shows a horizontal scrollable bar chart of recent days' step counts
            StepStatsGraphView(
                stepTrackerViewModel: StepTrackerViewModel()
            )
        }
    }
}

#Preview {
    StatsView()
}

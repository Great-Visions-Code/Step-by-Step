//
//  StepStatsGraphView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

struct StepStatsGraphView: View {
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    private let maxBarHeight: CGFloat = 200

    var body: some View {
        VStack {
            Text("Step Count Timeline")
                .font(.title2)
                .bold()
                .padding(.leading, 10)

            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .bottom, spacing: 10) {
                        let stepData = stepTrackerViewModel.sortedStepData()
                        let maxStepCount = stepData.map { $0.steps }.max() ?? 1

                        ForEach(stepData.indices, id: \.self) { index in
                            let entry = stepData[index]
                            StepStatsProgressBarView(
                                value: entry.steps,
                                label: entry.date,
                                maxValue: maxStepCount,
                                maxHeight: maxBarHeight
                            )
                            .id(index) // Assign an ID for programmatic scrolling
                        }
                    }
                    .padding()
                }
                .onChange(of: stepTrackerViewModel.sortedStepData().map(\.date)) { oldDates, newDates in
                    if oldDates != newDates, let lastIndex = stepTrackerViewModel.sortedStepData().indices.last {
                        scrollProxy.scrollTo(lastIndex, anchor: .trailing) // Instantly scroll to last entry
                    }
                }
            }
        }
        .onAppear {
            stepTrackerViewModel.updateStepHistory()
        }
    }
}

/// **Mock ViewModel for Preview**
class MockStepTrackerViewModel: StepTrackerViewModel {
    override func sortedStepData() -> [(date: String, steps: Int)] {
        return [
            ("Mon", 3500),
            ("Tue", 3400),
            ("Wed", 3000),
            ("Thu", 10200),
            ("Fri", 4100),
            ("Sat", 4000),
            ("Sun", 2800),
            ("Mon", 3500),
            ("Tue", 3400),
            ("Wed", 3000),
            ("Thu", 20200),
            ("Fri", 4100),
            ("Sat", 4000),
            ("Sun", 2800)
        ]
    }
}

#Preview {
    StepStatsGraphView(stepTrackerViewModel: MockStepTrackerViewModel())
}

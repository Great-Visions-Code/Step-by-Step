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
            Text("Last 7 Days of Steps")
                .font(.title2)
                .bold()
            
            HStack(alignment: .bottom, spacing: 12) {
                let maxStepCount = stepTrackerViewModel.sortedStepData().map  { $0.steps }.max() ?? 1
                
                ForEach(stepTrackerViewModel.sortedStepData(), id: \.date) { date, steps in
                    StepStatsProgressBarView(
                        value: steps,
                        label: date,
                        maxValue: maxStepCount,
                        maxHeight: maxBarHeight
                    )
                }
            }
            .padding()
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

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
            Spacer()
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    let stepData = stepTrackerViewModel.sortedStepData()
                    let maxStepCount = stepData.map { $0.steps }.max() ?? 1
                    
                    ZStack(alignment: .topLeading) {
                        // Max line
                        VStack {
                            HStack {
                                Spacer()
                                
                                Text("🏆 Best Step Count: \(maxStepCount)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .padding(.trailing, 25)
                            }
                            Rectangle()
                                .fill(Color.blue.opacity(0.4))
                                .frame(height: 1)
                        }
                        .frame(height: maxBarHeight, alignment: .top)
                        .zIndex(1)

                        // Bar graph
                        HStack(alignment: .bottom, spacing: 10) {
                            ForEach(stepData.indices, id: \.self) { index in
                                let entry = stepData[index]
                                StepStatsProgressBarView(
                                    value: entry.steps,
                                    label: entry.date,
                                    maxValue: maxStepCount,
                                    maxHeight: maxBarHeight
                                )
                                .id(index)
                            }
                        }
                        .padding()
                    }
                }
                .onChange(of: stepTrackerViewModel.sortedStepData().map(\.date)) { oldDates, newDates in
                    if oldDates != newDates, let lastIndex = stepTrackerViewModel.sortedStepData().indices.last {
                        scrollProxy.scrollTo(lastIndex, anchor: .trailing)
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
            ("Thu", 3200),
            ("Fri", 4100),
            ("Sat", 4000),
            ("Sun", 2800)
        ]
    }
}

#Preview {
    StepStatsGraphView(stepTrackerViewModel: MockStepTrackerViewModel())
}

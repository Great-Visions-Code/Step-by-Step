//
//  StepStatsGraphView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//

import SwiftUI

/// A scrollable bar graph that visualizes daily step counts.
///
/// Displays:
/// - A graph of steps for each day
/// - A highlighted line for the highest step count
/// - Automatically scrolls to the latest entry when data changes
///
/// Used inside `StatsView` to provide historical step context.
struct StepStatsGraphView: View {
    /// Tracks and provides step data from HealthKit
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    /// Maximum height of a bar in the graph
    private let maxBarHeight: CGFloat = 150

    var body: some View {
        ZStack {
            // Background card with style
            Rectangle()
                .foregroundStyle(.wave3)
                .opacity(0.25)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack {
                // Section title
                Text("Daily Steps")
                    .font(.title)
                    .opacity(0.95)
                    .fontWeight(.semibold)
                    .padding()
                
                // Horizontal scrolling container
                ScrollViewReader { scrollProxy in
                    ScrollView(.horizontal, showsIndicators: true) {
                        let stepData = stepTrackerViewModel.sortedStepData()
                        let maxStepCount = stepData.map { $0.steps }.max() ?? 1
                        
                        ZStack(alignment: .topLeading) {
                            // MARK: - Top Line for Max Step Day
                            VStack {
                                HStack {
                                    Spacer()
                                    
                                    Image(systemName: "trophy")
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                    
                                    Text("Best Step Count: \(maxStepCount)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        .padding(.trailing, 24)
                                }
                                
                                Rectangle()
                                    .fill(Color.wave3.opacity(0.95))
                                    .frame(height: 1)
                            }
                            .frame(height: maxBarHeight, alignment: .top)
                            .zIndex(1) // Renders above the bars

                            // MARK: - Bar Chart
                            HStack(alignment: .bottom) {
                                ForEach(stepData.indices, id: \.self) { index in
                                    let entry = stepData[index]
                                    
                                    StepStatsProgressBarView(
                                        value: entry.steps,
                                        label: entry.date,
                                        maxValue: maxStepCount,
                                        maxHeight: maxBarHeight
                                    )
                                    .containerRelativeFrame(
                                        .horizontal,
                                        count: 7,
                                        spacing: 12
                                    )
                                    .id(index) // Used to scroll to this index
                                }
                            }
                            .padding()
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.paging) // Optional: enables automatic snap-to-element scrolling
                    
                    // Scrolls to latest bar when new step history loads
                    .onChange(of: stepTrackerViewModel.sortedStepData().map(\.date)) { oldDates, newDates in
                        if oldDates != newDates,
                           let lastIndex = stepTrackerViewModel.sortedStepData().indices.last {
                            scrollProxy.scrollTo(lastIndex, anchor: .trailing)
                        }
                    }
                }
            }
        }
        .frame(height: 302)
        .onAppear {
            // Loads step history when view becomes visible
            stepTrackerViewModel.updateStepHistory()
        }
    }
}

// MARK: - Mock ViewModel for SwiftUI Preview

/// Mocked version of `StepTrackerViewModel` to simulate data in previews
class MockStepTrackerViewModel: StepTrackerViewModel {
    override func sortedStepData() -> [(date: String, steps: Int)] {
        return [
            ("8/1/25", 3500), ("8/2/25", 3400), ("8/3/25", 3000),
            ("8/4/25", 10200), ("8/5/25", 4100), ("8/6/25", 4000),
            ("8/7/25", 2800), ("8/8/25", 3500), ("8/9/25", 3400),
            ("8/10/25", 3000), ("8/11/25", 3200), ("8/12/25", 4100),
            ("8/13/25", 4000), ("8/14/25", 2800), ("8/15/25", 4000)
        ]
    }
}

// MARK: - SwiftUI Previews

#Preview {
    StepStatsGraphView(stepTrackerViewModel: MockStepTrackerViewModel())
}

#Preview("DashboardView") {
    let previewAchievementsViewModel = AchievementsViewModel()
    let previewStepTrackerViewModel = StepTrackerViewModel()
    let previewStoryCardViewModel = StoryCardViewModel()
    let previewPlayerStatsViewModel = PlayerStatsViewModel()
    
    DashboardView(
        stepTrackerViewModel: previewStepTrackerViewModel,
        achievementsViewModel: previewAchievementsViewModel,
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: previewAchievementsViewModel,
            playerStatsViewModel: previewPlayerStatsViewModel
        ),
        playerStatsViewModel: previewPlayerStatsViewModel,
        storyCardViewModel: previewStoryCardViewModel
    )
}

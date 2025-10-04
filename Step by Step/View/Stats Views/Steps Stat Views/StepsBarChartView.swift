//
//  StepsBarChartView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 9/23/25.
//

import Foundation
import SwiftUI
import Charts

/// A horizontally scrollable bar chart that visualizes daily step counts.
///
/// ## Responsibilities
/// - Display daily steps as bars with labels above each bar.
/// - Show **7 days at a time** and allow horizontal scrolling for more history.
/// - Integrate with `StepTrackerViewModel` to reflect step-history updates.
///
/// ## Design
/// - Wrapped in `CardView` to match the app’s card UI style (consistent with other stat cards).
/// - Bars use rounded corners and concise annotations for readability.
/// - The Y-axis is aligned to the trailing side for visual balance with left-aligned titles.
/// - Thin horizontal rule lines indicate:
///   - The **maximum** step count line (`RuleMark` at `maxStepCount`)
///   - The **7-day average** line (`RuleMark` at `sevenDayAvg`)
///
/// ## Ownership & State
/// - Observes a parent-owned `StepTrackerViewModel`.
/// - Pulls chronological data (oldest → newest) via `sortedStepData()`.
///
/// > Note: If you need VoiceOver to speak both the axis date and the bar’s value in one phrase,
/// consider adding a `.accessibilityLabel` to the `BarMark` content or wrapping with a
/// `ChartContent` that supplies a custom label.
struct StepsBarChartView: View {
    
    /// View model providing sorted step history data.
    /// - Important: This view does not own the view model; the parent is responsible for lifecycle.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    var body: some View {
        ZStack {
            // Decorative card background; visually groups the chart with other dashboard cards.
            // If VoiceOver verbosity becomes an issue, consider `.accessibilityHidden(true)` here.
            CardView()
            
            VStack(alignment: .leading) {
                // Section title
                Text("Daily Steps")
                    .font(AppStyle.Card.titleFont)
                    .foregroundStyle(AppStyle.Colors.secondaryText)
                    .padding()
                
                // Pull step data once for this render pass.
                // Invariant: `sortedStepData()` returns oldest → newest; Charts will respect order andaxes formatting.
                let stepData = stepTrackerViewModel.sortedStepData()
                
                // Precompute lines' inputs for clarity (and to avoid repeated property lookups).
                let maxStepCount = stepTrackerViewModel.maxStepCount
                // Keep Double for rule value, Int for label/formatting where needed.
                let sevenDayAvg = max(0, stepTrackerViewModel.stepTracker.sevenDayStepAverage)
                
                // Main chart body.
                // The `Chart` DSL is declarative; each mark describes a part of the chart.
                Chart {
                    // Bars (one per day). We key by .date string which is unique per day in history.
                    ForEach(stepData, id: \.date) { stepHistoryData in
                        BarMark(
                            x: .value("Date", stepHistoryData.date),
                            y: .value("Steps", stepHistoryData.steps)
                        )
                        .cornerRadius(8) // Rounded corners to match modern iOS styling and the cardlanguage.
                        .annotation(position: .top) {
                            // Compact annotation above the bar with comma separators.
                            Text(stepHistoryData.steps.formatted())
                                .font(.caption2)
                                .foregroundStyle(AppStyle.Colors.primaryText)
                            // NOTE(gustavo): If numbers regularly overlap at smaller sizes,
                            // consider .minimumScaleFactor(0.8) or hiding labels below a threshold.
                        }
                    }
                    
                    // MARK: - maxStepCount line
                    // Horizontal line at `maxStepCount`; provides a quick "best on window" visual reference.
                    if maxStepCount > 0 {
                        RuleMark(y: .value("Max Steps", maxStepCount))
                            .foregroundStyle(.secondary)
                            .lineStyle(StrokeStyle(lineWidth: 1, dash: [4]))
                        // TODO(gustavo): Optionally add `.annotation` to label the rule (e.g., "Best").
                    }
                    
                    // MARK: - 7-day average line
                    // Horizontal dashed rule for the 7-day average across the shown domain.
                    if sevenDayAvg > 0 {
                        RuleMark(y: .value("7-Day Avg", sevenDayAvg))
                            .foregroundStyle(.secondary)
                            .lineStyle(StrokeStyle(lineWidth: 1, dash: [8]))
                        // NOTE: Consider a legend chip in the header if you want users to recognize this line quickly.
                    }
                }
                .padding()
                .chartXAxis {
                    // Show ~7 ticks for readability; Charts will pick nice labels (using the string domain).
                    AxisMarks(position: .bottom, values: .automatic(desiredCount: 7))
                }
                .chartYAxis {
                    // Trailing Y-axis fits with left-aligned title; easier to read values near bars.
                    AxisMarks(position: .trailing)
                }
                .chartScrollableAxes(.horizontal) // Enables horizontal scrolling through history.
                .chartXVisibleDomain(length: 7)   // Attempt to show exactly 7 days within the visible domain.
                // Start scroll so the last 7 days are visible (safe when empty due to max(..., 0)).
                .chartScrollPosition(initialX: stepData[max(stepData.count - 7, 0)].date)
                // FIXME(gustavo): If you observe "jumping" when data refreshes, consider
                // maintaining explicit `@State` for scroll position and update it inside `onChange`.
            }
        }
        .frame(height: 300) // Fixed container height to align with surrounding dashboard cards.
        // TODO(gustavo): Consider injecting a flexible max height via initializer if needed for iPad layouts.
    }
}

/// Preview-only mock version of `StepTrackerViewModel`.
///
/// - Generates random-ish step history for a configurable number of days.
/// - Used to render SwiftUI previews without HealthKit or real data.
///
/// > Note: Dates are formatted `"M/d/yy"` to match the expected format in the app.
fileprivate final class StepHistoryMockStepTrackerViewModel: StepTrackerViewModel {
    private let mockHistory: [(date: String, steps: Int)]
    /// Initializes with synthetic random step data for the past `historyDays`.
    ///
    /// - Parameters:
    ///   - historyDays: Number of days of history to generate (default: 30).
    ///   - base: Baseline average steps (default: 4,000).
    ///   - variance: Random variance range (default: 6,000).
    /// - Note: Generates oldest → newest ordering to match `sortedStepData()` contract.
    init(historyDays: Int = 30, base: Int = 4000, variance: Int = 6000) {
        // Generate "M/d/yy" strings to match VM expectations.
        let cal = Calendar.current
        let df = DateFormatter()
        df.dateFormat = "M/d/yy"
        
        var hist: [(date: String, steps: Int)] = []
        
        // Generate step data, oldest → newest (so x-axis scroll aligns with real usage).
        for i in stride(from: historyDays - 1, through: 0, by: -1) {
            let day = cal.startOfDay(for: Date())
                .addingTimeInterval(TimeInterval(-86400 * i)) // subtract i days
            let steps = max(0, base + Int.random(in: -variance...variance))
            hist.append((date: df.string(from: day), steps: steps))
        }
        self.mockHistory = hist
        super.init()
        // Seed today's step count for preview alignment with the last bar.
        self.updateCurrentSteps(to: hist.last?.steps ?? 0)
    }
    /// Returns the synthetic sorted step history.
    override func sortedStepData() -> [(date: String, steps: Int)] {
        mockHistory
    }
    /// No-op in previews. Real implementation would pull from HealthKit or cache.
    override func updateStepHistory() {
        // no-op
    }
}

// MARK: - Previews
#Preview("Steps Bar Chart • 14 Days") {
    StepsBarChartView(
        stepTrackerViewModel: StepHistoryMockStepTrackerViewModel(historyDays: 14)
    )
    .background(Color(.systemBackground)) // Preview against system background for Light/Dark verification.
    // TODO(gustavo): Add an additional preview with .environment(\.sizeCategory,.accessibilityExtraExtraExtraLarge)
    // to validate Dynamic Type clamping/overlap behaviors.
}

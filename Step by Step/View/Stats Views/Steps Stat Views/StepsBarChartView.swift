//
//  StepsBarChartView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 9/23/25.
//

import Foundation
import SwiftUI
import Charts

/// A horizontally scrollable, selection-enabled bar chart for daily step counts.
///
/// ## Responsibilities
/// - Visualize historical daily steps as bars, oldest → newest (7 visible by default).
/// - Surface reference rules for **Best**, **7-Day Avg**, and **Goal**.
/// - Support **tap/drag selection** to focus a single day while dimming others.
///
/// ## Design
/// - Wrapped in `CardView` to match the app’s card visual language (rounded, subtle depth).
/// - Header row shows a title plus compact legend chips aligned to the trailing edge.
/// - Bars display **always-on** numeric labels above each column (clamped via `minimumScaleFactor`).
/// - “Today” is treated as active when no explicit selection exists, so the latest day stands out.
///
/// ## Ownership & State
/// - Observes a **parent-owned** `StepTrackerViewModel`; this view does not manage its lifecycle.
/// - Stores local UI state for the selected bar (`selectedDay`) to control dimming/highlighting.
///
/// ## Accessibility
/// - Bars use the Charts framework’s built-in semantics for x/y encodings.
/// - Value annotations include simple, readable labels (e.g., “7,583”).
/// - Legend chips use text + color to avoid relying on color alone.
///
/// ## Threading & Performance
/// - Computations in `body` are O(n) over `stepData` and limited to simple aggregates.
/// - Headroom (`topY`) avoids label clipping without extra layout passes.
/// - Charts handles virtualized scrolling; avoid heavy per-bar work in closures.
///
/// > Note: If you introduce expensive formatting or date parsing, move that out of `body`
/// into a memoized helper or view model property to keep scrolling smooth.
///
struct StepsBarChartView: View {
    
    // MARK: - Dependencies
    
    /// View model providing sorted step history data.
    /// - Important: This view does **not** own the view model; the parent is responsible for lifecycle.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    // MARK: - Selection State
    
    /// The currently selected day (string key `"M/d/yy"`). `nil` means no explicit selection.
    /// When `nil`, the chart treats **today** (if present) as the active bar for subtle emphasis.
    @State private var selectedDay: String? = nil
    
    /// Opacity used to dim non-selected bars.
    /// - Rationale: Keeps context visible while gently spotlighting the focus day.
    private let dimmedOpacity: Double = 0.18
    
    // MARK: - Body
    
    var body: some View {
        // Pull step data once for this render pass.
        // Invariant: `sortedStepData()` returns oldest → newest; Charts respects the domain ordering.
        let stepData = stepTrackerViewModel.sortedStepData()
        
        // Precompute inputs for reference rules (avoid repeated property lookups).
        let maxStepCount = stepTrackerViewModel.maxStepCount                                // Int
        let sevenDayAvg = max(0.0, stepTrackerViewModel.stepTracker.sevenDayStepAverage)   // Double
        let stepGoal = stepTrackerViewModel.stepTracker.totalStepsGoal                     // Int
        
        // Build a "today key" using the same format that `sortedStepData()` provides: "M/d/yy".
        // This allows a lightweight equality check rather than parsing dates for each row.
        let todayKey: String = {
            let df = DateFormatter()
            df.locale = Locale(identifier: "en_US_POSIX")
            df.calendar = Calendar(identifier: .gregorian)
            df.dateFormat = "M/d/yy"
            return df.string(from: Calendar.current.startOfDay(for: Date()))
        }()
        
        // Calculate headroom above the tallest reference so annotations do not clip.
        // We consider: tallest bar, best line, average line, and goal line.
        let dataMax = Double(stepData.map(\.steps).max() ?? 0)
        let maxStepCountD = Double(maxStepCount)
        let stepGoalD = Double(stepGoal)
        let tallest = max(dataMax, max(maxStepCountD, max(sevenDayAvg, stepGoalD)))
        let topY = tallest * 1.12  // ~12% headroom; tweak if labels still risk clipping.
        
        ZStack {
            // Decorative card background; visually groups the chart with other dashboard cards.
            CardView()
            
            VStack(alignment: .leading) {
                // MARK: Header (title + legend)
                HStack {
                    Text("Daily Steps")
                        .font(AppStyle.Card.titleFont)
                        .foregroundStyle(AppStyle.Colors.secondaryText)
                    Spacer()
                    ChartLegendChipView(color: .blue,   label: "Best")
                    ChartLegendChipView(color: .yellow, label: "7-Day Avg")
                    ChartLegendChipView(color: .orange, label: "Goal")
                }
                .padding([.horizontal, .top])
                
                // MARK: Chart / Empty State
                Group {
                    if stepData.isEmpty {
                        // Empty state: shown when there is no step history.
                        // Keeps the card height consistent and communicates state clearly.
                        VStack(spacing: 8) {
                            Text("No step history yet") // TODO(gustavo): Localize
                                .font(.footnote)
                                .foregroundStyle(AppStyle.Colors.secondaryText)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                    } else {
                        
                        // Main chart body. Each mark describes a part of the visualization.
                        Chart {
                            // MARK: Bars (one per day)
                            ForEach(stepData, id: \.date) { d in
                                let isToday = (d.date == todayKey)
                                // If we have a selection, only the selected bar is “active”.
                                let isActive = (selectedDay == nil ? isToday : selectedDay == d.date)
                                // Dimming rules for bars and labels when selection is set.
                                let barOpacity = selectedDay == nil ? 1 : (isActive ? 1 : 0.35)
                                let labelOpacity = selectedDay == nil
                                    ? (isToday ? 1 : 0.55)
                                    : (isActive ? 1 : 0.45)
                                BarMark(
                                    x: .value("Date", d.date),
                                    y: .value("Steps", d.steps)
                                )
                                .cornerRadius(8) // Rounded columns to match the rest of our card language.
                                .foregroundStyle(isActive ? .blue : .blue.opacity(dimmedOpacity))
                                .opacity(barOpacity)
                                .annotation(position: .top) {
                                    // Always show a label; dim it when not selected to reduce clutter.
                                    Text(d.steps.formatted()) // e.g., "7,583" (no compact "k" formatting)
                                        .font(.caption2)
                                        .foregroundStyle(AppStyle.Colors.primaryText)
                                        .opacity(labelOpacity)
                                        .minimumScaleFactor(0.75)
                                        .allowsTightening(true)
                                        .lineLimit(1)
                                        .accessibilityLabel("\(d.steps) steps")
                                }
                                // NOTE: Charts provides default accessibility for marks (x/y encodings).
                            }
                            
                            // MARK: Best (max) rule
                            if maxStepCount > 0 {
                                RuleMark(y: .value("Max Steps", Double(maxStepCount)))
                                    .foregroundStyle(.blue)
                                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [2]))
                                // TODO(gustavo): Consider adding `.annotation` for “Best” if users miss the legend.
                            }
                            
                            // MARK: 7-Day Avg rule
                            if sevenDayAvg > 0 {
                                RuleMark(y: .value("7-Day Avg", sevenDayAvg))
                                    .foregroundStyle(.yellow)
                                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [2]))
                            }
                            
                            // MARK: Goal rule
                            if stepGoal > 0 {
                                RuleMark(y: .value("Target", Double(stepGoal)))
                                    .foregroundStyle(.orange)
                                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [2]))
                            }
                        }
                        .padding()
                        .chartXAxis {
                            // Show ~7 ticks for readability; Charts will pick appropriate labels for the string domain.
                            AxisMarks(position: .bottom, values: .automatic(desiredCount: 7))
                        }
                        .chartYAxis {
                            // Trailing y-axis complements the left-aligned title and keeps values close to bars.
                            AxisMarks(position: .trailing)
                        }
                        .chartScrollableAxes(.horizontal) // Enables horizontal panning through history.
                        .chartXVisibleDomain(length: 7)   // Target 7 visible days (Charts will adapt as needed).
                        .chartYScale(domain: 0...topY)    // Reserve headroom to avoid annotation clipping.
                        // Start scrolled to the most recent 7 days (safe index when dataset is small/empty).
                        .chartScrollPosition(initialX: stepData[max(stepData.count - 7, 0)].date)
                        // MARK: Interaction: selection
                        .chartXSelection(value: $selectedDay) // Tap/drag to select a bar by its x-value (date key)
                        .onChange(of: selectedDay) { old, new in
                            // Optional behavior: tapping the same bar clears selection (toggles focus).
                            if old == new { selectedDay = nil }
                        }
                        // FIXME(gustavo): If scroll “jumps” during live updates, consider tracking
                        // and restoring explicit scroll position with an @State value.
                    }
                }
            }
        }
        .frame(height: 300) // Fixed container height to align with surrounding dashboard cards.
        // TODO(gustavo): Consider making height configurable for iPad / compact widgets.
    }
}

// MARK: - Preview Utilities
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
#Preview("Steps Bar Chart - 14 Days") {
    StepsBarChartView(
        stepTrackerViewModel: StepHistoryMockStepTrackerViewModel(historyDays: 14)
    )
    // TODO(gustavo): Add an additional preview with
    // `.environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)` to validate
    // Dynamic Type behaviors for annotations and the legend row.
}

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

// MARK: - DailyStepsWindowChartView (Public entry point)

public struct DailyStepsWindowChartView: View {
    @ObservedObject public var stepTrackerViewModel: StepTrackerViewModel

    @State private var windows: [[(date: String, steps: Int)]] = []
    @State private var selectedPage: Int = 0
    @State private var previousDateIdentifiers: [String] = []

    private let windowSize = 7
    private let maxBarHeight: CGFloat = 180

    public init(stepTrackerViewModel: StepTrackerViewModel) {
        self.stepTrackerViewModel = stepTrackerViewModel
    }

    public var body: some View {
        CardContainer {
            VStack(alignment: .leading, spacing: 16) {
                header

                if windows.isEmpty {
                    emptyState
                } else {
                    chartPager
                }
            }
            .padding(20)
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            stepTrackerViewModel.updateStepHistory()
            handleDataChange(stepData: stepTrackerViewModel.sortedStepData(), animate: false)
        }
        .onChange(of: stepTrackerViewModel.stepTracker.stepHistory) { newHistory in
            handleDataChange(stepData: newHistory, animate: true)
        }
    }

    private var header: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Daily Steps")
                .font(ThemeShim.headerFont)
                .fontWeight(.semibold)
                .foregroundStyle(ThemeShim.primaryTextColor)

            Spacer()

            HStack(spacing: 8) {
                LegendChip(color: ChartTheme.bestLineColor, label: "Best", style: .solid)
                LegendChip(color: ChartTheme.averageLineColor, label: "7-Day Avg", style: .dashed)
            }
        }
    }

    private var chartPager: some View {
        TabView(selection: $selectedPage) {
            ForEach(Array(windows.enumerated()), id: \.offset) { index, entries in
                WindowChartPage(
                    entries: entries,
                    isLastPage: index == windows.count - 1,
                    dateForTodayMatch: todayStorageIdentifier,
                    maxBarHeight: maxBarHeight
                )
                .tag(index)
                .padding(.horizontal, 4)
            }
        }
        .frame(height: maxBarHeight + 72)
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .animation(ChartConstants.animation, value: selectedPage)
    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "figure.walk")
                .font(.title2)
                .foregroundStyle(ThemeShim.secondaryTextColor.opacity(0.8))

            Text("No step data yet")
                .font(ThemeShim.subheadlineFont)
                .foregroundStyle(ThemeShim.secondaryTextColor)
        }
        .frame(maxWidth: .infinity)
        .frame(height: maxBarHeight + 72)
        .accessibilityElement(children: .combine)
    }

    private var todayStorageIdentifier: String? {
        ChartDateHelper.storageString(for: Date())
    }

    private func handleDataChange(stepData: [(date: String, steps: Int)], animate: Bool) {
        let newWindows = stepData.chunked(into: windowSize)
        let newDates = stepData.map(\.date)
        let appendedNewDay = newDates.count > previousDateIdentifiers.count || newDates.last != previousDateIdentifiers.last
        let lastIndex = max(newWindows.count - 1, 0)

        var targetPage = appendedNewDay ? lastIndex : min(selectedPage, lastIndex)
        if newWindows.isEmpty {
            targetPage = 0
        }

        let applyChanges = {
            self.windows = newWindows
            self.selectedPage = targetPage
        }

        if animate {
            withAnimation(ChartConstants.animation) {
                applyChanges()
            }
        } else {
            applyChanges()
        }

        previousDateIdentifiers = newDates
    }
}

private struct CardContainer<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            CardBackgroundCompatView()
            content
        }
        .clipShape(RoundedRectangle(cornerRadius: ThemeShim.cardCornerRadius, style: .continuous))
        .shadow(color: ThemeShim.shadowColor, radius: 14, x: 0, y: 8)
    }
}

// MARK: - WindowChartPage (Internal view for a single 7-day window)

private struct WindowChartPage: View {
    let entries: [(date: String, steps: Int)]
    let isLastPage: Bool
    let dateForTodayMatch: String?
    let maxBarHeight: CGFloat

    private let pageMax: Int
    private let pageAverage: Double
    private let barSpacing: CGFloat

    init(entries: [(date: String, steps: Int)], isLastPage: Bool, dateForTodayMatch: String?, maxBarHeight: CGFloat) {
        self.entries = entries
        self.isLastPage = isLastPage
        self.dateForTodayMatch = dateForTodayMatch
        self.maxBarHeight = maxBarHeight

        let computedMax = entries.map(\.steps).max() ?? 0
        self.pageMax = computedMax
        if entries.isEmpty {
            self.pageAverage = 0
        } else {
            let total = entries.reduce(0) { $0 + $1.steps }
            self.pageAverage = Double(total) / Double(entries.count)
        }
        self.barSpacing = ChartConstants.barSpacing(forCount: entries.count, isLastPage: isLastPage)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            chartArea
        }
        .frame(maxWidth: .infinity)
    }

    private var chartArea: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottomLeading) {
                if pageMax > 0 {
                    ReferenceLine(
                        value: Double(pageMax),
                        maxValue: Double(max(pageMax, 1)),
                        color: ChartTheme.bestLineColor,
                        labelText: "Best \(ChartFormatters.steps(pageMax))",
                        accessibilityText: "Best on page \(ChartFormatters.steps(pageMax))",
                        style: StrokeStyle(lineWidth: 1)
                    )
                    .padding(.trailing, 6)
                }

                if pageAverage > 0 {
                    ReferenceLine(
                        value: pageAverage,
                        maxValue: Double(max(pageMax, 1)),
                        color: ChartTheme.averageLineColor,
                        labelText: "Avg \(ChartFormatters.steps(Int(pageAverage.rounded())))",
                        accessibilityText: "7-day average \(ChartFormatters.steps(Int(pageAverage.rounded())))",
                        style: StrokeStyle(lineWidth: 1, dash: [5, 4])
                    )
                    .padding(.trailing, 6)
                }

                HStack(alignment: .bottom, spacing: barSpacing) {
                    ForEach(Array(entries.enumerated()), id: \.offset) { _, entry in
                        let displayLabel = ChartDateHelper.shortLabel(for: entry.date)
                        BarColumn(
                            value: entry.steps,
                            rawDate: entry.date,
                            displayLabel: displayLabel,
                            isToday: dateForTodayMatch == entry.date,
                            pageMax: Double(pageMax),
                            maxBarHeight: maxBarHeight
                        )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            }
        }
        .frame(height: maxBarHeight)
        .animation(ChartConstants.animation, value: pageMax)
        .animation(ChartConstants.animation, value: pageAverage)
        .animation(ChartConstants.animation, value: entries.map(\.steps))
    }

    private struct ReferenceLine: View {
        let value: Double
        let maxValue: Double
        let color: Color
        let labelText: String
        let accessibilityText: String
        let style: StrokeStyle

        var body: some View {
            GeometryReader { proxy in
                let clampedMax = max(maxValue, 1)
                let normalized = max(0, min(value / clampedMax, 1))
                let yPosition = proxy.size.height * CGFloat(1 - normalized)

                ZStack(alignment: .topTrailing) {
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: yPosition))
                        path.addLine(to: CGPoint(x: proxy.size.width, y: yPosition))
                    }
                    .stroke(color.opacity(0.95), style: style)
                    .animation(ChartConstants.animation, value: value)
                    .animation(ChartConstants.animation, value: maxValue)

                    Text(labelText)
                        .font(.caption2)
                        .fontWeight(.medium)
                        .foregroundStyle(color)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            Capsule()
                                .fill(Color(.systemBackground).opacity(0.85))
                        )
                        .offset(x: -2, y: max(yPosition - 22, -8))
                }
            }
            .allowsHitTesting(false)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(accessibilityText)
        }
    }
}

// MARK: - BarColumn (Internal)

private struct BarColumn: View {
    let value: Int
    let rawDate: String
    let displayLabel: String
    let isToday: Bool
    let pageMax: Double
    let maxBarHeight: CGFloat

    private var barHeight: CGFloat {
        guard pageMax > 0 else { return value > 0 ? 6 : 2 }
        let ratio = CGFloat(value) / CGFloat(pageMax)
        let scaled = maxBarHeight * ratio
        return value > 0 ? max(scaled, 6) : max(scaled, 2)
    }

    var body: some View {
        VStack(spacing: 6) {
            Text(ChartFormatters.steps(value))
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(ThemeShim.primaryTextColor)
                .minimumScaleFactor(0.6)
                .lineLimit(1)

            RoundedRectangle(cornerRadius: ChartConstants.barCornerRadius, style: .continuous)
                .fill(ChartTheme.barGradient)
                .frame(width: ChartConstants.barWidth, height: barHeight)
                .overlay(
                    RoundedRectangle(cornerRadius: ChartConstants.barCornerRadius, style: .continuous)
                        .stroke(ChartTheme.barHighlightColor.opacity(isToday ? 1 : 0), lineWidth: isToday ? 3 : 0)
                )
                .shadow(color: ChartTheme.barShadowColor.opacity(isToday ? 0.35 : 0.18), radius: isToday ? 6 : 4, x: 0, y: isToday ? 4 : 2)

            Text(displayLabel)
                .font(.caption2)
                .foregroundStyle(ThemeShim.secondaryTextColor)
                .minimumScaleFactor(0.7)
                .lineLimit(1)
        }
        .frame(width: ChartConstants.barWidth, maxHeight: .infinity, alignment: .bottom)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(ChartDateHelper.accessibilityLabel(for: rawDate)) steps \(ChartFormatters.steps(value))")
        .accessibilityAddTraits(isToday ? .isSelected : [])
        .animation(ChartConstants.animation, value: value)
        .animation(ChartConstants.animation, value: pageMax)
    }
}

// MARK: - LegendChip (Internal)

private struct LegendChip: View {
    enum Style {
        case solid
        case dashed
    }

    let color: Color
    let label: String
    let style: Style

    var body: some View {
        HStack(spacing: 6) {
            symbol
                .frame(width: 20, height: 10)

            Text(label)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundStyle(ThemeShim.secondaryTextColor)
                .lineLimit(1)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(
            Capsule(style: .continuous)
                .fill(color.opacity(0.12))
        )
        .accessibilityElement(children: .combine)
    }

    private var symbol: some View {
        ZStack {
            Capsule(style: .continuous)
                .stroke(color, style: StrokeStyle(lineWidth: 2, dash: style == .dashed ? [4, 3] : []))

            if style == .solid {
                Capsule(style: .continuous)
                    .fill(color.opacity(0.75))
            }
        }
    }
}

// MARK: - Theme shim (Internal) fallback

#if canImport(Step_by_Step)
typealias AppStyleCompat = AppStyle
typealias CardBackgroundCompatView = CardBackgroundView
#else
private enum AppStyleCompat {
    enum Card {
        static let cornerRadius: CGFloat = 24
        static let backgroundColor: Color = ColorPalette.wave3
        static let backgroundOpacity: Double = 0.25
    }

    enum Colors {
        static let primaryText: Color = .primary
        static let secondaryText: Color = .secondary
    }

    enum Typography {
        static let titleFont: Font = .headline
        static let valueFont: Font = .title3
        static let subheadlineFont: Font = .caption
    }
}

private struct CardBackgroundCompatView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: AppStyleCompat.Card.cornerRadius, style: .continuous)
            .fill(AppStyleCompat.Card.backgroundColor)
            .opacity(AppStyleCompat.Card.backgroundOpacity)
    }
}
#endif

private enum ThemeShim {
    static var cardCornerRadius: CGFloat { AppStyleCompat.Card.cornerRadius }
    static var primaryTextColor: Color { AppStyleCompat.Colors.primaryText }
    static var secondaryTextColor: Color { AppStyleCompat.Colors.secondaryText }
    static var headerFont: Font { AppStyleCompat.Typography.titleFont }
    static var subheadlineFont: Font { AppStyleCompat.Typography.subheadlineFont }
    static var shadowColor: Color { Color.black.opacity(0.08) }
}

private enum ColorPalette {
    static var wave3: Color {
        #if canImport(UIKit)
        if UIColor(named: "wave3", in: .main, compatibleWith: nil) != nil {
            return Color("wave3", bundle: .main)
        }
        #endif
        return Color(red: 87 / 255, green: 140 / 255, blue: 255 / 255)
    }
}

private enum ChartTheme {
    static let bestLineColor: Color = ColorPalette.wave3
    static let averageLineColor: Color = ColorPalette.wave3.opacity(0.6)
    static let barGradient: LinearGradient = LinearGradient(
        colors: [ColorPalette.wave3.opacity(0.35), ColorPalette.wave3],
        startPoint: .bottom,
        endPoint: .top
    )
    static let barHighlightColor: Color = Color.white.opacity(0.85)
    static let barShadowColor: Color = ColorPalette.wave3

    static func barSpacing(forCount count: Int, isLastPage: Bool) -> CGFloat {
        if isLastPage && count < 7 {
            switch count {
            case 0...2: return 20
            case 3...4: return 16
            case 5: return 14
            default: break
            }
        }

        switch count {
        case 0...3: return 18
        case 4...5: return 14
        default: return 10
        }
    }
}

private enum ChartConstants {
    static let animation = Animation.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 0.2)
    static let barWidth: CGFloat = 26
    static let barCornerRadius: CGFloat = 10

    static func barSpacing(forCount count: Int, isLastPage: Bool) -> CGFloat {
        ChartTheme.barSpacing(forCount: count, isLastPage: isLastPage)
    }
}

private enum ChartFormatters {
    private static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSize = 3
        formatter.maximumFractionDigits = 0
        return formatter
    }()

    static func steps(_ value: Int) -> String {
        numberFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}

private enum ChartDateHelper {
    private static let storageFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yy"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter
    }()

    private static let shortFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("Md")
        formatter.timeZone = TimeZone.current
        return formatter
    }()

    private static let accessibilityFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeZone = TimeZone.current
        return formatter
    }()

    static func parse(_ value: String) -> Date? {
        storageFormatter.date(from: value)
    }

    static func shortLabel(for value: String) -> String {
        guard let date = parse(value) else { return value }
        return shortFormatter.string(from: date)
    }

    static func accessibilityLabel(for value: String) -> String {
        guard let date = parse(value) else { return value }
        return accessibilityFormatter.string(from: date)
    }

    static func storageString(for date: Date) -> String {
        storageFormatter.string(from: date)
    }
}

private extension Array {
    func chunked(into size: Int) -> [[Element]] {
        guard size > 0 else { return [Array(self)] }
        var chunks: [[Element]] = []
        var index = startIndex
        while index < endIndex {
            let nextIndex = self.index(index, offsetBy: size, limitedBy: endIndex) ?? endIndex
            chunks.append(Array(self[index..<nextIndex]))
            index = nextIndex
        }
        return chunks
    }
}

// MARK: - Mock ViewModel + Previews

final class MockStepTrackerViewModel: StepTrackerViewModel {
    private let mockData: [(date: String, steps: Int)]

    init(mockData: [(date: String, steps: Int)]) {
        self.mockData = mockData
        super.init()
    }

    override func updateCurrentStepCount() { }
    override func updateCurrentDistance() { }
    override func updateSevenDayStepAverage() { }
    override func updateStepHistory() { }

    override func sortedStepData() -> [(date: String, steps: Int)] {
        mockData
    }
}

private func makePreviewData(days: Int) -> [(date: String, steps: Int)] {
    let calendar = Calendar.current
    let endDate = calendar.startOfDay(for: Date())
    return (0..<days).compactMap { offset in
        guard let date = calendar.date(byAdding: .day, value: offset - (days - 1), to: endDate) else { return nil }
        let base = 6_000 + (offset % 7) * 1_150
        let modulation = (offset % 3 == 0) ? 2_200 : (offset % 5 == 0 ? 4_000 : 0)
        return (ChartDateHelper.storageString(for: date), base + modulation)
    }
}

#Preview("Daily Steps – Multi-page") {
    DailyStepsWindowChartView(stepTrackerViewModel: MockStepTrackerViewModel(mockData: makePreviewData(days: 21)))
        .padding()
        .background(Color(.systemGroupedBackground))
}

#Preview("Dashboard Layout") {
    ScrollView {
        VStack(spacing: 24) {
            DailyStepsWindowChartView(stepTrackerViewModel: MockStepTrackerViewModel(mockData: makePreviewData(days: 21)))
            DailyStepsWindowChartView(stepTrackerViewModel: MockStepTrackerViewModel(mockData: makePreviewData(days: 7)))
        }
        .padding()
    }
    .background(Color(.systemGroupedBackground))
}

#Preview("Short History") {
    DailyStepsWindowChartView(stepTrackerViewModel: MockStepTrackerViewModel(mockData: makePreviewData(days: 4)))
        .padding()
        .background(Color(.systemGroupedBackground))
}

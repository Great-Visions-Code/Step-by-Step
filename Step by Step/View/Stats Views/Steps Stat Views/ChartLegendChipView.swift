//
//  ChartLegendChipView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/8/25.
//

import SwiftUI

/// A compact “legend chip” used to label chart references (e.g., **Best**, **7-Day Avg**, **Goal**).
///
/// ## Responsibilities
/// - Visually pair a small color swatch with a short, descriptive label.
/// - Provide a consistent, compact legend style that can be reused across charts.
///
/// ## Design
/// - A tiny filled `Circle` (color key) followed by a caption-sized label.
/// - Minimal inner padding to keep chips compact when multiple are placed in a row.
/// - Uses app semantic color tokens for the text via `AppStyle.Colors.secondaryText`.
///
/// ## Ownership & State
/// - Stateless view. All data is provided by the parent via `color` and `label`.
/// - No side effects; safe to reuse freely in lists or stacks.
///
/// ## Accessibility
/// - The label is regular `Text`, so it is announced naturally by VoiceOver.
/// - If you compose multiple chips together, consider providing additional context
///   at the parent (e.g., “Legend: …”) to better group meaning for assistive tech.
///
/// ## Threading & Performance
/// - Pure SwiftUI view with no heavy work in `body`.
/// - Suitable for reuse in repeated layouts (e.g., HStacks above charts).
///
/// > Note:
/// > Keep labels short to preserve horizontal space in dense chart headers.
///
/// > TODO(gustavo): Localize `label` content when localization is added across the app.
struct ChartLegendChipView: View {
    // MARK: - Dependencies
    /// The color of the circular swatch. Typically matches the line/bar color the chip explains.
    let color: Color
    /// The short legend text (e.g., "Best", "7-Day Avg", "Goal").
    let label: String
        
    // MARK: - Body
    var body: some View {
        HStack(spacing: 4) {
            // Small color key. Keep size modest so multiple chips fit comfortably on small screens.
            Circle()
                .fill(color)
                .frame(width: 8, height: 8)
            // Descriptive label for the legend key.
            Text(label)
                .font(.caption2) // Compact to reduce header height in chart toolbars
                .foregroundStyle(AppStyle.Colors.secondaryText)
        }
        // Tight inner padding to visually separate chips without overwhelming the layout.
        .padding(.horizontal, 2)
        .padding(.vertical, 4)
        // NOTE: Background is intentionally omitted; parent can add a container or chip background if needed.
    }
}

// MARK: - Previews
#Preview {
    // Example usage with multiple chips to demonstrate spacing and visual rhythm.
    ZStack {
        CardView()
        
        HStack(spacing: 12) {
            ChartLegendChipView(
                color: .yellow,
                label: "Max Step Count"
            )
            
            ChartLegendChipView(
                color: .blue,
                label: "7-Day Avg"
            )
            
            ChartLegendChipView(
                color: .orange,
                label: "Goal"
            )
        }
    }
    .padding()
}

// MARK: - Maintenance Notes
// TODO(gustavo): Consider an optional background style (e.g., capsule with subtle fill) for higher contrast contexts.
// TODO(gustavo): Add an initializer overload that accepts a `LocalizedStringKey` for `label` once localization lands.
// NOTE: If the chart header becomes crowded, consider truncating or abbreviating labels (e.g., “Avg”, “Best”).

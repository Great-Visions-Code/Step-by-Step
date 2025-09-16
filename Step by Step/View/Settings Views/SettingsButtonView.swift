//
//  SettingsButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 7/27/25.
//
import SwiftUI
/// A **card-styled settings button** that visually matches the app's card design.
///
/// - Purpose: Reusable tap target for Settings-style rows, with a leading icon,
///   title, optional subtitle, and a trailing chevron.
/// - Design: Shares the same background and typography tokens as `NavigationCardView`
///   via `CardBackgroundView` and `AppStyle.StatsView`.
///
/// Example:
/// ```swift
/// SettingsButtonView(
///     title: "Daily Step Goal",
///     subtitle: "5,000 Steps",
///     icon: "figure.walk",
///     action: { isStepGoalEditorPresented = true }
/// )
/// ```
struct SettingsButtonView: View {
    
    /// Main label (e.g., "Daily Step Goal")
    let title: String
    
    /// Optional supporting text (e.g., "5,000 Steps")
    let value: String?

    /// Action executed when the card is tapped.
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .leading) {
                CardBackgroundView()
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(AppStyle.StatsView.titleFont)
                            .foregroundStyle(AppStyle.StatsView.titleFontColor)
                        
                        if let value = value {
                            Text(value)
                                .font(AppStyle.StatsView.valueFont)
                                .foregroundStyle(AppStyle.StatsView.valueFontColor)
                                .bold()
                        }
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(AppStyle.StatsView.valueFont)
                        .foregroundStyle(AppStyle.StatsView.titleFontColor)
                }
                .padding()
            }
            .frame(height: 92)
        }
    }
}

#Preview("Single Button") {
    SettingsButtonView(
        title: "Notifications",
        value: "Off",
        action: { }
    )
}

#Preview {
    VStack(spacing: 16) {
        SettingsButtonView(
            title: "Daily Step Goal",
            value: "5,000 Steps",
            action: { }
        )
        SettingsButtonView(
            title: "Developer Testing",
            value: "Adjust stats",
            action: { }
        )
    }
}

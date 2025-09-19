//
//  CardNavigationView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 8/26/25.
//
import SwiftUI
/// A **card-styled navigation link** that visually matches the app's cards
///
/// - Purpose: Provides a consistent card UI element that can navigate to another screen.
/// - Example use cases:
///   - "Achievements → View"
///   - "Survive Story → Continue"
///
/// Example:
/// ```swift
/// CardNavigationView(
///     title: "Achievements",
///     value: "View",
///     subheading: "Unlocked: 3 of 10",
///     destination: AchievementsListView(...)
/// )
/// ```
struct CardNavigationView<Destination: View>: View {
    /// Primary title displayed at the top of the card.
    /// Example: `"Achievements"`
    var title: String
    
    /// The main value or action prompt.
    /// Example: `"View"` or `"Continue"`
    var value: String
    
    /// An optional subheading providing supporting info.
    /// Example: `"Locked"`
    var subheading: String?
    
    /// The destination view this card navigates to when tapped.
    var destination: Destination
    
    var body: some View {
        // NavigationLink ensures the entire card is tappable.
        NavigationLink(destination: destination) {
            ZStack(alignment: .leading) {
                // Reusable background view for consistent card styling
                CardBackgroundView()
                
                HStack {
                    // MARK: - Left Side Content (Textual Info)
                    VStack(alignment: .leading, spacing: 4) {
                        // Title (small top label)
                        Text(title)
                            .font(AppStyle.StatsView.titleFont)
                            .foregroundStyle(AppStyle.StatsView.titleFontColor)
                        
                        // Main value (bigger, bold text)
                        Text(value)
                            .font(AppStyle.StatsView.valueFont)
                            .foregroundStyle(AppStyle.StatsView.valueFontColor)
                            .bold()
                        
                        Spacer()
                        
                        // Subheading (optional extra info, shown at bottom left)
                        if let subheading = subheading {
                            Text(subheading)
                                .font(AppStyle.StatsView.subheadlineFont)
                                .foregroundStyle(AppStyle.StatsView.titleFontColor)
                                .lineLimit(2) // Wraps to 2 lines max
                        }
                    }
                    
                    Spacer()
                    
                    // MARK: - Right Side Content (Chevron)
                    Image(systemName: "chevron.right")
                        .font(AppStyle.StatsView.valueFont)
                        .foregroundStyle(AppStyle.StatsView.titleFontColor)
                }
                .padding()
            }
            .frame(height: 92) // Consistent card height
        }
    }
}
// MARK: - SwiftUI Previews
#Preview {
    CardNavigationView(
        title: "Achievements",
        value: "View",
        subheading: nil,
        destination: AchievementsView(
            achievementsViewModel: AchievementsViewModel(),
            stepTrackerViewModel: StepTrackerViewModel(),
            healthKitViewModel: HealthKitViewModel()
        )
    )
}

#Preview("StatsView") {
    StatsView(
        stepTrackerViewModel: StepTrackerViewModel()
    )
}

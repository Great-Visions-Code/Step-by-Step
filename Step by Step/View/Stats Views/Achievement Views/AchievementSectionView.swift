//
//  AchievementSectionView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/15/25.
//
import SwiftUI
/// A reusable section view that groups a list of achievements under a titled header.
///
/// This view helps visually organize achievements by category, such as:
/// - "Steps In A Day"
/// - "Total Steps Taken"
/// - "Story Progress"
///
/// Each achievement is displayed using `AchievementCardView`, which handles
/// the presentation of individual achievement details (title, description, status, etc.).
///
/// Typical usage:
/// ```swift
/// AchievementSectionView(
///     title: "Steps In A Day",
///     achievements: dailyStepAchievements
/// )
/// ```
struct AchievementSectionView: View {
    /// The title shown above the section (e.g., "Steps In A Day").
    var title: String
    
    /// The list of achievements to display in the section.
    /// Each entry is rendered into its own `AchievementCardView`.
    var achievements: [AchievementCardItems]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12) {
            // MARK: - Section Title
            // Describes the category of achievements (e.g., "Total Distance Traveled").
            Text(title)
                .font(AppStyle.Typography.sectionTitleFont)
                .foregroundStyle(AppStyle.Colors.secondaryText)
            
            // MARK: - Achievement Cards
            // Render each achievement directly without reconstructing it.
            ForEach(achievements) { achievement in
                AchievementCardView(achievementCardItems: achievement)
            }
        }
    }
}

// MARK: - SwiftUI Preview
#Preview {
    AchievementSectionView(
        title: "Steps In A Day",
        achievements: [
            AchievementCardItems(
                title: "5,000",
                description: "Walk 5,000 steps in a single day",
                isCompleted: true,
                dateEarned: "03/01/25",
                progressNote: nil
            ),
            AchievementCardItems(
                title: "Survive Day 2",
                description: "Complete Day 2",
                isCompleted: false,
                dateEarned: nil,
                progressNote: "Steps to go: 5,000"
            ),
            AchievementCardItems(
                title: "Survive Day 3",
                description: "Complete Day 3",
                isCompleted: false,
                dateEarned: nil,
                progressNote: "Steps to go: 10,000"
            )
        ]
    )
}

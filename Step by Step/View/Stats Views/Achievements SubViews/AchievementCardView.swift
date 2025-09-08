    //
    //  AchievementCardView.swift
    //  Step by Step
    //
    //  Created by Gustavo Vazquez on 3/3/25.
    //

    import SwiftUI

    /// A single card view displaying an achievement's status, description, and optional metadata.
    ///
    /// - Shows:
    ///   - An icon that visually communicates whether the achievement is completed or pending.
    ///   - The achievement title and description.
    ///   - Optional progress notes (e.g., "Steps to go: 3,000") if the achievement is in progress.
    ///   - The completion date if the achievement has been earned.
    ///   - A "Completed" label for additional visual confirmation.
    ///
    /// - Styling:
    ///   - Background uses `.wave3` with reduced opacity for consistency with the app’s theme.
    ///   - Rounded corners use the shared `AppStyle.cornerRadius` constant for consistency.
    ///   - Blue is consistently used as the "completed / active" accent color.
    struct AchievementCardView: View {
        /// A structured representation of the achievement to be displayed.
        /// Provides all the data needed to populate the card.
        let achievementCardItems: AchievementCardItems

        var body: some View {
            ZStack {
                // MARK: - Background Card
                // Light translucent rectangle styled as a card container.
                Rectangle()
                    .foregroundStyle(.wave3)   // Custom app color
                    .opacity(0.25)             // Semi-transparent for subtlety
                    .clipShape(
                        RoundedRectangle(cornerRadius: AppStyle.cornerRadius)
                    )
                
                // MARK: - Card Content
                HStack(spacing: 13) {
                    // MARK: - Completion Status Icon
                    // Uses SF Symbols: checkmark when completed, circle when not.
                    Image(systemName: achievementCardItems.isCompleted
                          ? "checkmark.circle.fill"
                          : "circle")
                        .foregroundStyle(
                            achievementCardItems.isCompleted ? .blue : .gray
                        )
                        .font(.title2)
                    
                    // MARK: - Textual Details
                    VStack(alignment: .leading, spacing: 4) {
                        // Title (e.g., "5,000 Steps")
                        Text(achievementCardItems.title)
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        // Description (e.g., "Walk 5,000 steps in a single day")
                        Text(achievementCardItems.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        // Progress Note (optional)
                        // Shown only if the achievement is not yet completed.
                        if let progress = achievementCardItems.progressNote {
                            Text(progress)
                                .font(.caption)
                                .foregroundStyle(.blue)
                        }
                        
                        // Completion Date (optional)
                        // Displays when the achievement was unlocked.
                        if let dateEarned = achievementCardItems.dateEarned {
                            Text("Date Earned: \(dateEarned)")
                                .font(.caption)
                                .foregroundStyle(.blue)
                        }
                    }
                    
                    Spacer()
                    
                    // MARK: - Completed Label
                    // Extra label reinforcement when an achievement is done.
                    if achievementCardItems.isCompleted {
                        Text("Completed")
                            .font(.footnote)
                            .foregroundStyle(.blue)
                    }
                }
                .padding(.horizontal) // Horizontal padding keeps spacing consistent
            }
            .frame(height: 96) // Fixed height ensures uniform card sizes in lists
        }
    }

    // MARK: - Preview Example
    #Preview {
        let steps: String = "10,000"
        
        AchievementCardView(
            achievementCardItems: AchievementCardItems(
                title: "\(steps) Steps",                           // Title of achievement
                description: "Walk \(steps) steps in a single day", // Description
                isCompleted: true,                                 // Completed status
                dateEarned: "04/01/25",                            // Example date earned
                progressNote: nil                                  // No progress note needed
            )
        )
    }

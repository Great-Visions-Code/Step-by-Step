//
//  SettingsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// A custom settings screen that surfaces app preferences, diagnostics, and support entry points.
///
/// ## Responsibilities
/// - Present entry points to configurable areas of the app (e.g., daily step goal, developer tools).
/// - Provide a support pathway to report bugs via pre-filled email (with optional diagnostics).
/// - Display basic app metadata ("About" section).
///
/// ## Design
/// - Uses `NavigationStack` with card-styled rows (`CardNavigationView`) to match the app’s visual language.
/// - Background wave pattern via `WaveBackground()` for brand consistency.
/// - Section headers use semantic text styles to respect Dynamic Type.
/// - The "About" card shows a compact list of metadata items with trailing values.
///
/// ## Ownership & State
/// - Observes three view models injected by the parent:
///   - `PlayerStatsViewModel` (player state: energy, health, etc.)
///   - `StepTrackerViewModel` (step history, goals)
///   - `AchievementsViewModel` (achievement state)
/// - This view does not create or retain its own model instances; lifecycle is owned by the parent.
///
/// ## Accessibility
/// - Relies on semantic text styles; no explicit a11y overrides added here.
/// - Card rows are fully tappable and use `NavigationLink` internally (via `CardNavigationView`).
///
/// ## Maintenance Notes
/// - Consider localizing user-facing strings (see TODOs).
/// - Avoid hard-coding sizing where possible; prefer semantic spacing/tokens if you add them to `AppStyle`.
/// - If the app adds more settings, group rows with clear section headers to maintain scan-ability.
///
struct SettingsView: View {
    
    // MARK: - Dependencies (Injected ViewModels)
    
    /// Player stats (energy, health, etc.). Owned by the parent coordinator/screen.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    /// Step tracking state and preferences (e.g., daily step goal).
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    /// Achievements state and derived progress.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Decorative app background; keep below content.
                WaveBackground()
                
                VStack(spacing: 12) {
                    
                    // TODO(gustavo): Localize "Settings".
                    Text("Settings")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    // MARK: - Preferences Section
                    
                    // TODO(gustavo): Localize all visible strings in settings rows.
                    CardNavigationView(
                        title: "Daily Step Goal",
                        value: "\(stepTrackerViewModel.stepTracker.totalStepsGoal) Steps",
                        subheading: nil,
                        destination: StepGoalEditorView(
                            stepTrackerViewModel: stepTrackerViewModel
                        )
                    )
                    
                    CardNavigationView(
                        title: "Developer Testing",
                        value: "Adjust Stats",
                        subheading: nil,
                        destination: DeveloperOptionsView(
                            playerStatsViewModel: playerStatsViewModel,
                            achievementsViewModel: achievementsViewModel
                        )
                    )
                    
                    // Report a Bug card with app metrics injected
                    CardNavigationView(
                        title: "Report a Bug",
                        value: "Email Developer",
                        subheading: nil,
                        destination: BugReportEmail(
                            appMetrics: [
                                "Step Goal": "\(stepTrackerViewModel.stepTracker.totalStepsGoal)"
                                // NOTE: Add more metrics if helpful, e.g. "Today Steps": "8,534".
                            ]
                        )
                    )
                    
                    // MARK: - About Section
                    
                    // TODO(gustavo): Localize "About", "App", "Version", "Developer".
                    Text("About")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    ZStack {
                        CardView()
                        VStack(spacing: 18) {
                            HStack {
                                Text("App")
                                Spacer()
                                Text(Brand.appDisplayName)
                                    .foregroundStyle(.secondary)
                            }
                            .font(.headline)
                            .padding(.horizontal)
                            
                            HStack {
                                Text("Version")
                                Spacer()
                                // Prefer reading version from bundle for accuracy.
                                // See `AppInfo.formattedVersion` implementation for details.
                                Text(AppInfo.formattedVersion)
                                    .foregroundStyle(.secondary)
                            }
                            .font(.headline)
                            .padding(.horizontal)
                            
                            HStack {
                                Text("Developer")
                                Spacer()
                                Text(Brand.companyName)
                                    .foregroundStyle(.secondary)
                            }
                            .font(.headline)
                            .padding(.horizontal)
                        }
                    }
                    // Rationale: Gives the "About" block a stable, compact height consistent with design mocks.
                    // If content grows (more rows), consider removing the fixed height and let content drive size.
                    .frame(height: 132)
                    
                    Spacer()
                }
                // Horizontal padding to align cards with other screens/components.
                .padding(.horizontal)
            }
        }
    }
}

// MARK: - Previews
#Preview {
    SettingsView(
        playerStatsViewModel: PlayerStatsViewModel(),
        stepTrackerViewModel: StepTrackerViewModel(),
        achievementsViewModel: AchievementsViewModel()
    )
}

#Preview("Dashboard") {
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

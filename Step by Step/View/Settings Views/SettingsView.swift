//
//  SettingsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//
import SwiftUI
/// A custom **Settings screen** where users can manage app preferences and view app info.
///
/// ### Features:
/// - Edit the **daily step goal**.
/// - Access **developer testing tools** (for debugging / internal testing).
/// - View app metadata (version, developer info).
///
/// ### Design Notes:
/// - Uses a custom `WaveBackground` for visual consistency with the rest of the app.
/// - Reuses card-style components (`CardNavigationView`, `CardView`)
///   for a unified, polished look.
/// - Organized with clear section headers (e.g., "About").
struct SettingsView: View {
    
    // MARK: - ViewModels
    
    /// Manages player health, energy, and progression stats.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    /// Manages step tracking, history, and daily step goal.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    /// Manages achievement progress and unlock logic.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - Background Layer
                WaveBackground()
                
                // MARK: - Main Content
                VStack(spacing: 12) {
                    
                    // Title section
                    Text("Settings")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    // MARK: - Preferences Section
                    // Daily step goal navigation card
                    CardNavigationView(
                        title: "Daily Step Goal",
                        value: "\(stepTrackerViewModel.stepTracker.totalStepsGoal) Steps",
                        subheading: nil,
                        destination: StepGoalEditorView(
                            stepTrackerViewModel: stepTrackerViewModel
                        )
                    )
                    
                    // Developer testing / debugging card
                    CardNavigationView(
                        title: "Developer Testing",
                        value: "Adjust Stats",
                        subheading: nil,
                        destination: DeveloperOptionsView(
                            playerStatsViewModel: playerStatsViewModel,
                            achievementsViewModel: achievementsViewModel
                        )
                    )
                    
                    // MARK: - About Section
                    // Title Section
                    Text("About")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    ZStack {
                        CardView() // Card background layer
                        
                        VStack(spacing: 18) {
                            // App version info
                            HStack {
                                Text("Version")
                                Spacer()
                                Text("0.0.00")
                                    .foregroundStyle(.secondary)
                            }
                            .font(.headline)
                            .padding(.horizontal)
                            
                            // Developer info
                            HStack {
                                Text("Developer")
                                Spacer()
                                Text("Great-Visions-Code")
                                    .foregroundStyle(.secondary)
                            }
                            .font(.headline)
                            .padding(.horizontal)
                        }
                    }
                    .frame(height: 92)
                    
                    Spacer() // Pushes all content towards the top
                }
                .padding(.horizontal)
            }
        }
    }
}
// MARK: - Preview
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

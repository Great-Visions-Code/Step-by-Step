//
//  Step_by_StepApp.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

/// The main entry point for the Step By Step application.
@main
struct StepByStepApp: App {
    // MARK: - StateObjects

    /// StateObject for managing user achievements across the app lifecycle.
    /// This ensures that achievement-related data persists as long as the app is running.
    @StateObject private var achievementsViewModel = AchievementsViewModel()
    
    /// StateObject for managing player stats across the app lifecycle.
    /// This includes managing health and energy points and ensures consistency across views.
    @StateObject private var playerStatsViewModel = PlayerStatsViewModel()
    
    /// StateObject for managing story content and progress, dependent on other view models.
    /// This handles the loading and updating of story chapters and decisions.
    @StateObject private var storyContentViewModel: StoryContentViewModel

    // MARK: - Initializer

    /// Initializes the app and sets up dependencies between view models.
    init() {
        // Shared instance of the AchievementsViewModel to be passed between views.
        let sharedAchievementsViewModel = AchievementsViewModel()
        
        // Shared instance of the PlayerStatsViewModel to ensure consistency in player stats.
        let sharedPlayerStatsViewModel = PlayerStatsViewModel()
        
        // Wrap shared instances into StateObjects to allow SwiftUI to observe changes.
        _achievementsViewModel = StateObject(wrappedValue: sharedAchievementsViewModel)
        _playerStatsViewModel = StateObject(wrappedValue: sharedPlayerStatsViewModel)
        
        // Create StoryContentViewModel with dependencies on other shared ViewModels.
        _storyContentViewModel = StateObject(wrappedValue: StoryContentViewModel(
            achievementsViewModel: sharedAchievementsViewModel,
            playerStatsViewModel: sharedPlayerStatsViewModel
        ))
    }

    // MARK: - Scene

    var body: some Scene {
        WindowGroup {
            // Launch the DashboardView as the root view, passing in all necessary ViewModels.
            DashboardView(
                achievementsViewModel: achievementsViewModel,
                storyContentViewModel: storyContentViewModel,
                playerStatsViewModel: playerStatsViewModel
            )
        }
    }
}

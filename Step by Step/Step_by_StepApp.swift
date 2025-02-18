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
    
    /// StateObject for managing step tracking progress.
    /// Ensures that the user's steps are tracked persistently across the app.
    @StateObject private var stepTrackerViewModel = StepTrackerViewModel()
    
    /// StateObject for managing the available stories.
    /// This ensures that the story completion progress updates dynamically.
    @StateObject private var storyViewModel = StoryCardViewModel()

    // MARK: - Initializer

    /// Initializes the app and sets up dependencies between view models.
    init() {
        // Shared instance of the AchievementsViewModel to be passed between views.
        let sharedAchievementsViewModel = AchievementsViewModel()
        
        // Shared instance of the PlayerStatsViewModel to ensure consistency in player stats.
        let sharedPlayerStatsViewModel = PlayerStatsViewModel()
        
        // Create shared instances for persistent tracking.
        let sharedStepTrackerViewModel = StepTrackerViewModel()
        let sharedStoryViewModel = StoryCardViewModel()
        
        // Wrap shared instances into StateObjects to allow SwiftUI to observe changes.
        _achievementsViewModel = StateObject(wrappedValue: sharedAchievementsViewModel)
        _playerStatsViewModel = StateObject(wrappedValue: sharedPlayerStatsViewModel)
        _stepTrackerViewModel = StateObject(wrappedValue: sharedStepTrackerViewModel)
        _storyViewModel = StateObject(wrappedValue: sharedStoryViewModel)
        
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
                stepTrackerViewModel: stepTrackerViewModel,
                achievementsViewModel: achievementsViewModel,
                storyContentViewModel: storyContentViewModel,
                playerStatsViewModel: playerStatsViewModel,
                storyViewModel: storyViewModel
            )
        }
    }
}

//
//  Step_by_StepApp.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

//
//  StepByStepApp.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

/// The main entry point for the Step By Step application.
@main
struct StepByStepApp: App {
    /// StateObject for managing user achievements across the app lifecycle.
    @StateObject private var achievementsViewModel = AchievementsViewModel()
    /// StateObject for managing story content and progress, dependent on `AchievementsViewModel`.
    @StateObject private var storyContentViewModel: StoryContentViewModel

    /// Initializes the app.
    init() {
        let sharedAchievementsViewModel = AchievementsViewModel()
        _achievementsViewModel = StateObject(wrappedValue: sharedAchievementsViewModel)
        _storyContentViewModel = StateObject(wrappedValue: StoryContentViewModel(
            achievementsViewModel: sharedAchievementsViewModel,
            playerStatsViewModel: PlayerStatsViewModel()
            )
        )
    }

    var body: some Scene {
        WindowGroup {
            // Launch the app with the `DashboardView`, passing required ViewModels.
            DashboardView(
                achievementsViewModel: achievementsViewModel,
                storyContentViewModel: storyContentViewModel
            )
        }
    }
}

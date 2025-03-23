//
//  SettingsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// View responsible for displaying and managing user settings within the app.
struct SettingsView: View {
    // ViewModel to manage the player's stats.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    // ViewModel to manage step tracking settings.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    /// ViewModel responsible for tracking user achievements.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    
    /// State to track whether the step goal editor is presented.
    @State private var isStepGoalEditorPresented = false
    /// State to track whether the developer options are presented.
    @State private var isDeveloperOptionsPresented = false
    
    var body: some View {
        NavigationView {
            Form {
                // MARK: - Daily Step Goal
                Section(header: Text("User Settings")) {
                    Button(action: {
                        isStepGoalEditorPresented.toggle()
                    }) {
                        HStack {
                            Text("Daily Step Goal")
                            Spacer()
                            Text("\(stepTrackerViewModel.stepTracker.totalStepsGoal) Steps")
                                .foregroundStyle(.gray)
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                // MARK: - Developer Options
                Section(header: Text("App Settings")) {
                    Button(action: {
                        isDeveloperOptionsPresented.toggle()
                    }) {
                        HStack {
                            Text("Developer Testing")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .sheet(isPresented: $isStepGoalEditorPresented) {
            StepGoalEditorView(stepTrackerViewModel: stepTrackerViewModel)
        }
        .sheet(isPresented: $isDeveloperOptionsPresented) {
            DeveloperOptionsView(playerStatsViewModel: playerStatsViewModel,
                                 achievementsViewModel: achievementsViewModel
            )
        }
    }
}

#Preview {
    SettingsView(
        playerStatsViewModel: PlayerStatsViewModel(),
        stepTrackerViewModel: StepTrackerViewModel(),
        achievementsViewModel: AchievementsViewModel()
    )
}

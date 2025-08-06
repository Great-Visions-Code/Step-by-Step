//
//  SettingsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// A custom settings screen that allows users to modify app preferences,
/// such as their daily step goal, and access developer testing tools.
///
/// This view uses a custom background (`WaveBackground`) and styled buttons (`SettingsButtonView`)
/// for a cohesive look and feel that aligns with the app’s design language.
struct SettingsView: View {
    
    /// ViewModel responsible for managing player health and energy stats.
    @ObservedObject var playerStatsViewModel: PlayerStatsViewModel
    
    /// ViewModel responsible for step tracking and goal management.
    @ObservedObject var stepTrackerViewModel: StepTrackerViewModel
    
    /// ViewModel responsible for managing achievement progress and state.
    @ObservedObject var achievementsViewModel: AchievementsViewModel
    
    /// Tracks whether the step goal editor modal is presented.
    @State private var isStepGoalEditorPresented = false
    
    /// Tracks whether the developer options modal is presented.
    @State private var isDeveloperOptionsPresented = false
    
    var body: some View {
        ZStack {
            // MARK: - Background Layer
            WaveBackground()
                .ignoresSafeArea()
            
            // MARK: - Main Content
            VStack(spacing: 32) {
                // Title
                Text("Settings")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                
                // Settings Options
                VStack(spacing: 16) {
                    // Daily Step Goal
                    SettingsButtonView(
                        title: "Daily Step Goal",
                        subtitle: "\(stepTrackerViewModel.stepTracker.totalStepsGoal) Steps",
                        icon: "figure.walk",
                        action: { isStepGoalEditorPresented = true }
                    )
                    
                    // Developer Options
                    SettingsButtonView(
                        title: "Developer Testing",
                        subtitle: "Adjust Stats",
                        icon: "wrench.and.screwdriver",
                        action: { isDeveloperOptionsPresented = true }
                    )
                    
                    Text("About")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    ZStack {
                        Rectangle()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.wave3)
                        VStack(spacing: 24) {
                            HStack {
                                Text("Version")
                                
                                Spacer()
                                
                                Text("0.0.0")
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.horizontal)
                            
                            HStack {
                                Text("Developer")
                                
                                Spacer()
                                
                                Text("Great-Visions-Code")
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .frame(width: 340, height: 88)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        // MARK: - Modals
        .sheet(isPresented: $isStepGoalEditorPresented) {
            StepGoalEditorView(stepTrackerViewModel: stepTrackerViewModel)
        }
        .sheet(isPresented: $isDeveloperOptionsPresented) {
            DeveloperOptionsView(
                playerStatsViewModel: playerStatsViewModel,
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

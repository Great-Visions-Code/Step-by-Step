//
//  HomeView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

struct HomeView: View {
    // ViewModel for managing stories
    @StateObject var viewModel: StoriesTitleCardViewModel
    
    // Pass navigation control from DashboardView.swift
    @Binding var navigateToStoryHome: Bool
    @Binding var currentEnergyPoints: Int
    
    // Variables used for testing with default values
    @State private var totalStepsGoal: Int = 10000
    @State private var currentStepsTaken: Int = 7000
    
    // Selected story passed to the parent view
    var onStorySelected: (StoryTitleCard) -> Void
    
    var body: some View {
        VStack {
            // MARK: CurrentStepsTakenProgress.swift GV 11/25/24
            CurrentStepsTakenProgressView(
                currentStepsTaken: currentStepsTaken,
                totalStepsGoal: totalStepsGoal
            )
            
            // MARK: ConvertToEnergyButtonView.swift GV 11/25/24
            ConvertToEnergyButtonView(
                currentStepsTaken: $currentStepsTaken,
                totalStepsGoal: $totalStepsGoal,
                currentEnergyPoints: $currentEnergyPoints
            )
            
            // MARK: CurrentEnergyProgressView.swift GV 11/27/24
            CurrentEnergyProgressView(
                currentEnergyPoints: currentEnergyPoints
            )
            
            // MARK: ChooseYourAdventureView.swift GV 11/27/24
            ChooseYourAdventureView(
                stories: viewModel.stories,
                onEnterStory: {
                    navigateToStoryHome = true
                },
                onStorySelected: onStorySelected
            )
        }
        .padding()    }
}

#Preview {
    HomeView(
        viewModel: StoriesTitleCardViewModel(),
        navigateToStoryHome: .constant(false),
        currentEnergyPoints: .constant(0),
        onStorySelected: { _ in }
    )
}

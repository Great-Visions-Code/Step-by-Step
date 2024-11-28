//
//  Test.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

struct HomeView: View {
    // ViewModel for managing stories
    @StateObject var viewModel: StoriesTitleCardViewModel
    
    // Variables used for testing with default values
    @State private var totalStepsGoal: Int = 10000
    @State private var currentStepsTaken: Int = 7000
    @State private var currentEnergyPoints: Int = 0
    
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
                stories: viewModel.stories
            )
        }
        .padding()    }
}

#Preview {
    HomeView(viewModel: StoriesTitleCardViewModel())
}

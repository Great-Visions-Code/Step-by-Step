//
//  HomeView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

struct HomeView: View {
    // ViewModel for managing stories
    @StateObject var viewModel: StoryTitleCardViewModel
    // Binding current EP
    @Binding var currentEnergyPoints: Int
    // Navigation path to track user navigation
    @State private var path = NavigationPath()
    // Track selected story
    @State private var selectedStory: StoryTitleCard? = nil
    
    @State private var totalStepsGoal: Int = 10000
    @State private var currentStepsTaken: Int = 7000

    var body: some View {
        NavigationStack(path: $path) {
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
                    onStorySelected: { story in
                        selectedStory = story
                        path.append("StoryDetailsView")
                    }
                )
            }
            .padding()
            // Hide TabView conditionally when navigating
            .navigationDestination(for: String.self) { destination in
                switch destination {
                case "StoryDetailsView":
                    if let story = selectedStory {
                        StoryDetailsView(
                            story: story,
                            onEnterStoryButton: {
                                path.append("StoryHomeView")
                            }
                        )
                    }
                case "StoryHomeView":
                    if let story = selectedStory {
                        StoryHomeView(
                            story: story,
                            currentEnergyPoints: currentEnergyPoints,
                            onNavigate: { path.append($0) }
                        )
                        // Hide TabView here
                        .toolbar(.hidden, for: .tabBar)
                    }
                case "StoryView":
                    StoryView()
                        // Hide TabView here
                        .toolbar(.hidden, for: .tabBar)
                case "StoryAchievementsView":
                    StoryAchievementsView()
                        // Hide TabView here
                        .toolbar(.hidden, for: .tabBar)
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    HomeView(
        viewModel: StoryTitleCardViewModel(),
        currentEnergyPoints: .constant(0)
    )
}

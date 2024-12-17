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

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                // MARK: CurrentStepsTakenProgress.swift GV 11/25/24
                CurrentStepsTakenProgressView(
                    currentStepsTaken: 7000,
                    totalStepsGoal: 10000
                )
                
                // MARK: ConvertToEnergyButtonView.swift GV 11/25/24
                ConvertToEnergyButtonView(
                    currentStepsTaken: .constant(7000),
                    totalStepsGoal: .constant(10000),
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
                    }
                case "StoryView":
                    StoryView()
                case "StoryAchievementsView":
                    StoryAchievementsView()
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

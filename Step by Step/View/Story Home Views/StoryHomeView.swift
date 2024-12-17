//
//  StoryHomeView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/1/24.
//

import SwiftUI

struct StoryHomeView: View {
    // Selected story to display details
    var story: StoryTitleCard
    var currentEnergyPoints: Int
    
    // Closure to handle navigation actions
    var onNavigateButton: (String) -> Void
    
    // Button text and corresponding actions/values
    let buttonActions: [(title: String, action: String)] = [
        ("Resume Story", "ResumeStoryView"),
        ("Start New Story", "StoryView"),
        ("Story Achievements", "StoryAchievementsView"),
    ]
    
    var body: some View {
        VStack {
            // MARK: StoryTitleView() GV 12/5/24
            StoryTitleView(
                title: story.title
            )
            .padding(.bottom, 25)

            // Health/Energy Progress Bar Section
            VStack(spacing: 20) {
                // MARK: StoryHPAndEPBarView() GV 12/5/24
                // Story HP Bar
                // NOTE: Possible loop here? GV 12/8/24
                StoryHPAndEPBarView(
                    currentPoints: 3,
                    maxPoints: 10,
                    barColor: .red,
                    labelText: "Health"
                )
                // Story EP Bar
                StoryHPAndEPBarView(
                    currentPoints: currentEnergyPoints,
                    maxPoints: 10,
                    barColor: .blue,
                    labelText: "Energy"
                )
            }
            .padding()
            
            VStack {
                // MARK: StoryDayAndChapterView() GV 12/8/24
                StoryDayAndChapterView(
                    storyDay: 3,
                    storyTotalDays: 10,
                    storyChapter: "Found Shelter"
                )
                .padding(.bottom, 20)
            
                // MARK: AttemptTrackerView() GV 12/8/24
                AttemptTrackerView(
                    newStoryAttempt: 3
                )
                .padding(.vertical, 20)
            }
            .padding()

            // MARK: StoryHomeNavigationButtonView() GV 12/8/24
            VStack(spacing: 20) {
                ForEach(buttonActions, id: \.title) { button in
                        StoryHomeNavigationButtonView(
                            buttonText: button.title,
                            buttonAction: {
                                onNavigateButton(button.action)
                        }
                    )
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryHomeView(
        story: StoryTitleCard(
            title: "Story Title",
            color: .green,
            completion: 100,
            details: "DETAILS NOT SHOWN"
        ),
        currentEnergyPoints: 5,
        onNavigateButton: { _ in }
    )
}

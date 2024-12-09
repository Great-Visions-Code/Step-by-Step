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
    
    // Button text
    let buttons: [String] = [
        "Resume Story",
        "Start New Story",
        "Achievements",
        "Return to Dashboard"
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
                    labelText: "Energy")
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

            // Navigation Section
            VStack(spacing: 20) {
                ForEach(buttons, id: \.self) { button in
                        StoryHomeNavigationButtonView(
                            buttonText: button,
                            buttonAction: nil
                    )
                }
            }
        }
        .padding()
    }
}

#Preview {
    StoryHomeView(
        story: StoryTitleCard(
            title: "Story Title",
            color: .green,
            completion: 100,
            details: ""
        ),
        currentEnergyPoints: 5
    )
}

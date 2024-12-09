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
    
    var body: some View {
        VStack {
            
            Spacer()
                        
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
                Button(action: {
                    // Resume Story Action
                }) {
                    Text("Resume Story")
                        .font(.title3)
                        .bold()
                        .padding()
                        .frame(width: 250)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(20)
                }
                
                Button(action: {
                    // Start Story Action
                }) {
                    Text("Start Story")
                        .font(.title3)
                        .bold()
                        .padding()
                        .frame(width: 250)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(20)
                }
                
                Button(action: {
                    // Achievements Action
                }) {
                    Text("Achievements")
                        .font(.title3)
                        .bold()
                        .padding()
                        .frame(width: 250)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(20)
                }
                
                Button(action: {
                    // Return to Dashboard Action
                }) {
                    Text("Return to Dashboard")
                        .font(.title3)
                        .bold()
                        .padding()
                        .frame(width: 250)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(20)
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

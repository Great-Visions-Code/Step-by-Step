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
    
    var body: some View {
        VStack {
            
            Spacer()
                        
            // MARK: StoryTitleView() GV 12/5/24
            StoryTitleView(
                title: story.title
            )
            
            // Health/Energy Progress Bar Section
            VStack(spacing: 10) {
                // MARK: StoryHPAndEPBarView() GV 12/5/24
                // Story HP Bar
                StoryHPAndEPBarView(
                    currentPoints: 3,
                    maxPoints: 10,
                    barColor: .red,
                    labelText: "Health"
                )
                
                // Story EP Bar
                StoryHPAndEPBarView(
                    currentPoints: 5,
                    maxPoints: 10,
                    barColor: .blue,
                    labelText: "Energy")
            }
            .padding()
            
            Spacer()
                .frame(width: 10 ,height: 20)
            
            // MARK: Day/Chapter Tracker
            VStack(spacing: 5) {
                // Day tracker
                Text("Day 3 out of 10")
                    .font(.title)
                    .fontWeight(.medium)
                
                // Current Chapter Title
                Text("\"Found Shelter\"")
                    .font(.title2)
                    .fontWeight(.medium)
                
                Spacer()
                    .frame(width: 50 ,height: 50)
                
                // New Attempt tracker
                Text("Attempt # 3")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding()
            
            Spacer()
                .frame(width: 10 ,height: 30)
            
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
            details: "")
    )
}

//
//  StoryHomeView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/1/24.
//

import SwiftUI

struct StoryHomeView: View {
    var body: some View {
        VStack {
            
            Spacer()
                        
            // MARK: Story title
            Text("Survive")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 55)
            
            // Health/Energy Progress Bar Section
            VStack(spacing: 10) {
                // MARK: StoryHealthBar() GV 12/3/24
                Text("5/10 Health")
                    .font(.title3)
                    .fontWeight(.heavy)
                
                // MARK: StoryEnergyBar() GV 12/3/24
                Text("5/10 Energy")
                    .font(.title3)
                    .fontWeight(.heavy)
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
                    .frame(width: 50 ,height: 20)
                
                // New Attempt tracker
                Text("Attempt # 3")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding()
            
            Spacer()
                .frame(width: 10 ,height: 70)
            
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
    StoryHomeView()
}

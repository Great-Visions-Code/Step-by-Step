//
//  DashboardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

struct DashboardView: View {
    // Variables used for testing with default values
    @State private var totalStepsGoal: Int = 10000
    @State private var currentStepsTaken: Int = 5000
    @State private var currentEnergyPoints: Int = 0
    
    var body: some View {
        VStack {
            
            // MARK: currentStepsTakenProgressView.swift GV 11/23/24
            /*
             TODO: Circular progress bar GV 11/22/24
                - Total should be totalStepsGoal
                - Progress should be tracked based on currentStepsTaken
            */
            // Display Steps Taken
            Text("Steps Taken:")
                .font(.title)
                .bold()
                .padding(.bottom, 2)
            // NOTE: Temporary display of steps taken out of goal in place of circular progress bar GV 11/22/24
            Text("\(currentStepsTaken) out of a goal of \(totalStepsGoal)")
                .font(.headline)
                .padding(.bottom)
            
            // MARK: convertToEnergyButtonView.swift GV 11/23/24
            // TODO: Add a simple scaling animation when a user taps on the button GV 11/24/24
            // Button to convert currentStepsTaken to currentEnergyPoints
            Button(action: {
                convertCurrentStepsTakenToCurrentEnergyPoints()
            }) {
                // Text for button
                Text("Convert to Energy")
                    .font(.title2)
                    .bold()
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(20)
            }
            // Displays currentEnergyPoints
            Text("Current Energy: \(currentEnergyPoints)")
                .font(.headline)
                .padding(.top)
            
            // MARK: GV 11/24/24
                // H. Scroll View for Title Cards
            // Display Choose Your Adventure
            Text("Choose Your Adventure:")
                .font(.title2)
                .bold()
                .padding(.top)
            // Horizontal scroll section for story title cards
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 15) {
                    // ForEach loop to generate title cards
                    ForEach(stories, id: \.title) { story in
                        StoryCardView(
                            title: "\(story.title)\n\nComplete: \(story.completion)%",
                            color: story.color
                        )
                    }
                }
                // Center Title Cards
                .padding(.horizontal, 27)
            }
            .padding(.top)
        }
        .padding()
    }
    
    // MARK: Function goes with convertToEnergyButtonView.swift GV 11/23/24
    // Function to convert currentStepsTaken to currentEnergyPoints
    private func convertCurrentStepsTakenToCurrentEnergyPoints() {
        // Calculate the energy based on the ratio
        let energyRatio = Double(currentStepsTaken) / Double(totalStepsGoal)
        let calculatedEnergy = Int(energyRatio * 10)
        // Updates currentEnergyPoints ensuring max of 10 energyPoints
        currentEnergyPoints = min(calculatedEnergy, 10)
        // Reset currentStepsTaken
        currentStepsTaken = 0
    }
}
// MARK: GV 11/24/24
// Reusable view for story title cards
struct StoryCardView: View {
    var title: String
    var color: Color
    
    // State variable for scaling animation
    @State private var isPressed = false
    
    var body: some View {
        VStack {
            // Title cards format
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding()
                .frame(width: 150, height: 150)
                .background(color)
                .cornerRadius(20)
                .scaleEffect(isPressed ? 0.95 : 1.0)
                .animation(.easeInOut(duration: 0.1), value: isPressed)
                .onTapGesture {
                    // Animate on press
                    withAnimation {
                        isPressed.toggle()
                    }
                    // Toggle back after a short delay (0.2 sec)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation {
                            isPressed.toggle()
                        }
                    }
                }
        }
    }
}

// Example story data structure
struct Story {
    let title: String
    let color: Color
    // TODO: Track completion percentage if needed
    let completion: Int
}

// Sample data for the stories
let stories = [
    Story(title: "Survive Step by Step", color: Color.green, completion: 15),
    Story(title: "Future Adventures", color: Color.gray, completion: 0)
]
#Preview {
    DashboardView()
}

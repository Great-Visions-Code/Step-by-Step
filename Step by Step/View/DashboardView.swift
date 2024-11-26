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
    @State private var selectedTab: Int = 1
    
    var body: some View {
        // MARK: TabView for bottom navigation
        TabView(selection: $selectedTab) {
            
            // MARK: Achievements Tab
            AchievementsView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Achievements")
                }
                .tag(0)
            // MARK: Dashboard (Home) Tab
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
            // MARK: Home Tab
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(1)
            
            // MARK: Settings Tab
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
                .tag(2)
        }
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

// MARK: Achievements placeholder view
struct AchievementsView: View {
    var body: some View {
        Text("Achievements Page")
            .font(.title)
            .padding()
    }
}

// MARK: Settings placeholder view
struct SettingsView: View {
    var body: some View {
        Text("Settings Page")
            .font(.title)
            .padding()
    }
}


#Preview {
    DashboardView()
}

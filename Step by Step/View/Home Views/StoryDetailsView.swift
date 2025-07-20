//
//  StoryDetailsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/1/24.
//

import SwiftUI

/// A detailed view showcasing the selected story's banner, completion progress, description, and entry action.
///
/// `StoryDetailsView` is responsible for presenting the player with an overview of a specific story.
/// This includes dynamic completion data (when available), a title banner, descriptive text, and a button to begin the story.
///
/// Typically accessed after selecting a story card from the dashboard or library.
struct StoryDetailsView: View {
    
    // MARK: - Dependencies
    
    /// The selected `StoryCard` containing metadata like title, completion, and descriptive text.
    let story: StoryCard

    /// Optional view model for dynamically reflecting the current completion percentage.
    let storyContentViewModel: StoryContentViewModel?

    /// Closure to handle the "Enter Story" button action.
    let onEnterStoryButton: () -> Void
    
    // MARK: - Dynamic Banner Logic
    
    /// Determines which banner image to display based on the `story` title.
    private var bannerImageName: String {
        story.storyTitle == "SURVIVE" ? "SurviveBannerImage" : "ComingSoonBannerImage"
    }
    
    // MARK: - View Body
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Banner Header Section
            
            ZStack(alignment: .bottom) {
                // Story banner image
                Image(bannerImageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 224)
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                // Black overlay to increase readability
                Rectangle()
                    .fill(Color.black)
                    .opacity(0.4)
                    .frame(maxWidth: .infinity, minHeight: 80, maxHeight: 80)
                
                // MARK: - Story Title & Completion Progress
                
                VStack {
                    StoryTitleTextView(
                        title: story.storyTitle,
                        font: .largeTitle,
                        fontWeight: .black,
                        fontWidth: .expanded,
                        fontDesign: .serif,
                        fontSize: 45,
                        kerning: 20,
                        foregroundColor: .white.opacity(0.75)
                    )
                    .padding(.leading)
                    
                    if story.storyTitle == "SURVIVE" {
                        Text("PROGRESS \(storyContentViewModel?.completionPercentage ?? 0)%")
                            .font(.subheadline)
                            .fontWeight(.black)
                            .fontWidth(.expanded)
                            .fontDesign(.serif)
                            .foregroundStyle(.white.opacity(0.75))
                            .kerning(1)
                    } else {
                        Text("More adventures in the works!")
                            .font(.subheadline)
                            .fontWeight(.black)
                            .fontWidth(.expanded)
                            .fontDesign(.serif)
                            .foregroundStyle(.white.opacity(0.75))
                            .kerning(1)
                    }
                }
                .padding(.bottom, 8)
            }

            // MARK: - Description & Enter Story Button
            
            ZStack {
                Color.black.ignoresSafeArea(edges: .all)
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Story descriptive text
                        Text(story.storyDetails)
                            .font(.body)
                            .fontDesign(.monospaced)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .padding(.top)
                        
                        // Enter Story button (hidden if "Stay Tuned")
                        if story.storyTitle != "Stay Tuned" {
                            Button(action: onEnterStoryButton) {
                                Text("ENTER STORY")
                                    .font(.largeTitle)
                                    .fontWeight(.black)
                                    .fontDesign(.monospaced)
                                    .frame(width: 352, height: 68)
                                    .background(Color.white.opacity(0.30))
                                    .foregroundStyle(.white.opacity(0.95))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top) // Allows banner to reach screen's top edge
        .navigationBarBackButtonHidden(true) // Removes the default back button
    }
}

// MARK: - Preview

#Preview {
    StoryDetailsView(
        story: StoryCard(
            storyTitle: "SURVIVE",
            storyCardImage: "SurviveStoryCardImage",
            storyCompletion: 0,
            storyDetails: """
            In 'Survive,' you wake up to the sound of blaring sirens and chaos outside your window. Overnight, your city has been overtaken by a zombie apocalypse, plunging your once-familiar world into danger and disarray.

            Your goal is simple yet daunting: survive for 5 in-game days and reach the evacuation center at the city's edge, where safety awaits. Each day presents new challenges, from scavenging for supplies to fending off zombies and navigating the unpredictable dangers of a collapsing society.

            This story is not just about survival—it's about taking steps to secure your fate. Literally. Your real-life steps fuel your progress in the game. The more steps you take, the more energy you earn to make critical decisions and advance through the story. But beware: impulsive choices may cost you dearly, whether it’s starvation, accidents, or hostile survivors.

            Will you make it to safety, or will you succumb to the chaos? Step into the story and find out!
            """
        ),
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        ),
        onEnterStoryButton: {}
    )
}

//
//  StoryCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// A tappable visual card representing a single interactive story in the Choose Your Adventure list.
///
/// Displays a full-width story image with a dark overlay and an optional progress bar.
/// When tapped, the card triggers a callback to allow parent views to navigate or present content.
///
/// Completion percentage is only shown for stories tied to a `StoryContentViewModel` (e.g., "Survive").
struct StoryCardView: View {
    
    /// A binding to the story model to reflect progress updates and selection state.
    @Binding var story: StoryCard
    
    /// View model that provides real-time progress updates for the active story.
    /// Only set for dynamic stories like "Survive".
    var storyContentViewModel: StoryContentViewModel?
    
    /// Callback triggered when the card is tapped.
    var onTitleCardSelected: () -> Void

    /// Used to animate a subtle scale-down effect on tap.
    @State private var isPressed = false
    
    var body: some View {
        ZStack {
            // MARK: - Background Story Art
            Image(story.storyCardImage)
                .resizable()
                .frame(width: 352, height: 184)
                .clipped()
            
            if let percentage = storyContentViewModel?.completionPercentage {
            // MARK: - Bottom Overlay for Progress
            Rectangle()
                .fill(.black)
                .opacity(0.6)
                .frame(height: 52)
                .frame(maxHeight: .infinity, alignment: .bottom)

            // MARK: - Progress Text + Bar
                VStack(spacing: 4) {
                    Text("Progress \(percentage)%")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white.opacity(0.9))
                        .monospacedDigit()

                    ProgressView(value: Double(percentage), total: 100)
                        .progressViewStyle(.linear)
                        .tint(.white)
                        .frame(height: 4)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(3)
                        .padding(.horizontal, 20)
                }
                .frame(height: 52)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .frame(width: 352, height: 184)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 5)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onTapGesture {
            withAnimation {
                isPressed = true
            }
            // Reset the press state after tap and invoke selection callback
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation {
                    isPressed = false
                }
                onTitleCardSelected()
            }
        }
        .onChange(of: storyContentViewModel?.completionPercentage, initial: false) { _, newValue in
            // Update bound model with new completion value (only for live-tracked stories)
            if let newValue, story.storyTitle == "SURVIVE" {
                story.storyCompletion = newValue
            }
        }
    }
}

#Preview {
    StoryCardView(
        story: .constant(
            StoryCard(
                storyTitle: "SURVIVE",
                storyCardImage: "SurviveStoryCardImage",
                storyCompletion: 50,
                storyDetails: "Dynamic story details."
            )
        ),
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        ),
        onTitleCardSelected: {}
    )
}

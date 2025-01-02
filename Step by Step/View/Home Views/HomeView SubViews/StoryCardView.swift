//
//  StoryCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// Represents a single story card in the "Choose Your Adventure" section.
///
/// This view displays the title, completion percentage, and color associated with a story.
/// Users can tap the card to trigger a callback, initiating navigation.
struct StoryCardView: View {
    /// The `StoryCard` model containing the data to display.
    var story: StoryCard
    
    /// Closure triggered when the card is tapped.
    var onTitleCardSelected: () -> Void

    /// State variable to manage the scaling animation when the card is pressed.
    @State private var isPressed = false
    
    var body: some View {
        VStack {
            // Display the story title with formatting for readability and scaling for longer titles.
            Text(story.title)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .lineLimit(2)
                .minimumScaleFactor(0.6)
                .padding()
            
            // Display the completion percentage, styled for a secondary emphasis.
            Text("Completed: \(story.completion)%")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.8))
        }
        .padding()
        .frame(width: 150, height: 150) // Set card dimensions.
        .background(story.color) // Use the story's assigned color as the background.
        .cornerRadius(20) // Add rounded corners for a polished look.
        .shadow(radius: 5) // Apply a shadow for a slight 3D effect.
        .scaleEffect(isPressed ? 0.95 : 1.0) // Add scaling animation when the card is pressed.
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onTapGesture {
            // Animate the press effect.
            withAnimation {
                isPressed.toggle()
            }
            // After a short delay, reset the animation and execute the callback.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation {
                    isPressed.toggle()
                }
                onTitleCardSelected()
            }
        }
    }
}

#Preview {
    StoryCardView(
        story: StoryCard(
            title: "Story Title",
            color: .green,
            completion: 100,
            details: ""
        ),
        onTitleCardSelected: {}
    )
}

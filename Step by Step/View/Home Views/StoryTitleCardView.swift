//
//  StoryTitleCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

struct StoryTitleCardView: View {
    // Story data to display
    var story: StoryTitleCard
    var onSelected: () -> Void

    // State variable for scaling animation
    @State private var isPressed = false
    
    var body: some View {
        VStack {
            // MARK: Display story title
            Text(story.title)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .lineLimit(2)
                // Scales longer story titles
                .minimumScaleFactor(0.6)
                .padding()
            
            // MARK: Display completion %
            Text("Completed: \(story.completion)%")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.8))
        }
        .padding()
        
        // MARK: Frame for gesture actions GV 12/1/24
        .frame(width: 150, height: 150)
        .background(story.color)
        .cornerRadius(20)
        .shadow(radius: 5)
        
        // MARK: Press gesture animation GV 12/1/24
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
                onSelected()
            }
        }
    }
}

#Preview {
    StoryTitleCardView(
        story: StoryTitleCard(
            title: "Story Title",
            color: .green,
            completion: 100,
            details: ""
        ),
        onSelected: {}
    )
}

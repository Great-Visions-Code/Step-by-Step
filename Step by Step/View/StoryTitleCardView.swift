//
//  StoryTitleCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

// Reusable view for story title cards
struct StoryTitleCardView: View {
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

#Preview {
    StoryTitleCardView(
        title: "Survive Step by Step\n\nCompleted: 10%",
        color: .green)
}

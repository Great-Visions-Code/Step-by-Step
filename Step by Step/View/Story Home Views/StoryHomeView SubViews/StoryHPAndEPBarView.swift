//
//  StoryHPAndEPBarView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/5/24.
//

import SwiftUI

/// A reusable progress bar view for displaying the player's health or energy levels in the game.
/// Features a labeled display of current and maximum points, a progress bar, and tick marks for visual clarity.
struct StoryHPAndEPBarView: View {
    // The current value of points (e.g., health or energy).
    var currentPoints: Int
    // The maximum value of points.
    let maxPoints: Int
    // The color of the progress bar.
    var barColor: Color
    // The label text to indicate whether the bar represents "Health" or "Energy".
    var labelText: String
    
    var body: some View {
        VStack(spacing: 5) {
            // Display the label and current/max points prominently.
            Text("\(currentPoints)/\(maxPoints) \(labelText)")
                .font(.title3)
                .fontWeight(.heavy)
            
            // Render the progress bar with tick marks.
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background bar with a subtle gray color.
                    Capsule()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 20)
                    
                    // Foreground bar to visually represent progress.
                    Capsule()
                        .fill(barColor)
                        .frame(width: geometry.size.width * CGFloat(currentPoints) / CGFloat(maxPoints),
                               height: 20)
                    
                    // Add tick marks evenly spaced along the progress bar.
                    ForEach(0...maxPoints, id: \.self) { tick in
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 2, height: 14)
                            .offset(x: geometry.size.width * CGFloat(tick) / CGFloat(maxPoints) - 1)
                    }
                }
            }
            .frame(height: 20) // Consistent height for the progress bar.
        }
        .padding(.horizontal) // Add horizontal padding for better alignment.
    }
}

#Preview {
    VStack(spacing: 20) {
        // Preview for health bar.
        StoryHPAndEPBarView(
            currentPoints: 3,
            maxPoints: 10,
            barColor: .red,
            labelText: "Health"
        )
        
        // Preview for energy bar.
        StoryHPAndEPBarView(
            currentPoints: 5,
            maxPoints: 10,
            barColor: .blue,
            labelText: "Energy"
        )
    }
}

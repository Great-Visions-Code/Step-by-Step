//
//  StoryHealthBarView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/5/24.
//

import SwiftUI

struct StoryHealthBarView: View {
    var currentHealthPoints: Int
    let maxHealthPoints: Int = 10
    
    var body: some View {
        VStack(spacing: 5) {
            // Display text health points
            Text("\(currentHealthPoints)/\(maxHealthPoints) Health")
                .font(.title3)
                .fontWeight(.heavy)
            
            // Progress bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    // Background bar
                    Capsule()
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 20)
                    
                    // Foreground bar showing health progress
                    Capsule()
                        .fill(Color.red)
                        .frame(width: geometry.size.width * CGFloat(currentHealthPoints) / CGFloat(maxHealthPoints), height: 20)
                    
                    // Tick marks
                    ForEach(0...maxHealthPoints, id: \.self) { tick in
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 2, height: 14)
                            .offset(x: geometry.size.width * CGFloat(tick) / CGFloat(maxHealthPoints) - 1)
                    }
                }
            }
            .frame(height: 20) // Set a consistent height
        }
        .padding(.horizontal)
    }
}

#Preview {
    StoryHealthBarView(currentHealthPoints: 3)
}

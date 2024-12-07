//
//  StoryHealthBarView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/5/24.
//

import SwiftUI

struct StoryHPAndEPBarView: View {
    var currentPoints: Int
    let maxPoints: Int
    var barColor: Color
    var labelText: String
    
    var body: some View {
        VStack(spacing: 5) {
            // Display text points
            Text("\(currentPoints)/\(maxPoints) \(labelText)")
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
                        .fill(barColor)
                        .frame(width: geometry.size.width * CGFloat(currentPoints) / CGFloat(maxPoints),
                               height: 20)
                    
                    // Tick marks
                    ForEach(0...maxPoints, id: \.self) { tick in
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 2, height: 14)
                            .offset(x: geometry.size.width * CGFloat(tick) / CGFloat(maxPoints) - 1)
                    }
                }
            }
            // Set a consistent height
            .frame(height: 20)
        }
        .padding(.horizontal)
    }
}

#Preview {
    VStack(spacing: 20) {
        StoryHPAndEPBarView(
            currentPoints: 3,
            maxPoints: 10,
            barColor: .red,
            labelText: "Health")
        
        StoryHPAndEPBarView(
            currentPoints: 5,
            maxPoints: 10,
            barColor: .blue,
            labelText: "Energy")
    }
}

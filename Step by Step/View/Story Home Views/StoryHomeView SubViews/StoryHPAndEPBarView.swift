//
//  StoryHPAndEPBarView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/5/24.
//

import SwiftUI

/// A reusable status bar view displaying the player's health or energy using heart and bolt icons.
/// The bar visually updates with animations when values change, ensuring consistent alignment.
struct StoryHPAndEPBarView: View {
    /// The current value of points (e.g., health or energy).
    var currentPoints: Int
    /// The maximum value of points.
    let maxPoints: Int
    /// The type of bar: "Health" or "Energy".
    var type: StatusBarType
    /// Customizable spacing between icons.
    var iconSpacing: CGFloat
    
    /// Animation trigger for smooth transitions.
    @State private var animateIcons = false
    
    /// Enum to differentiate between health and energy bars.
    enum StatusBarType {
        case health
        case energy
    }
    
    var body: some View {
        VStack {
            // **Label indicating the type (Health or Energy)**
            Text("\(currentPoints)/\(maxPoints) \(type == .health ? "Health" : "Energy")")
                .font(.title3)
                .bold()
            
            // **Aligned Capsule Background**
            ZStack(alignment: .center) {
                // Background for alignment
                Capsule()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 30)
                
                // **HStack containing hearts or bolts**
                HStack(spacing: iconSpacing) {  // ✅ Uses customizable spacing
                    ForEach(0..<maxPoints, id: \.self) { index in
                        let isFilled = index < currentPoints
                        let icon = type == .health ? (isFilled ? "heart.fill" : "heart") : (isFilled ? "bolt.fill" : "bolt")
                        let color = type == .health ? (isFilled ? Color.red : Color.gray) : (isFilled ? Color.blue : Color.gray)
                        
                        Image(systemName: icon)
                            .foregroundStyle(color)
                            .font(.title2) // Standardized size
                            .scaleEffect(animateIcons && isFilled ? 1.2 : 1.0) // "Pop" effect
                            .opacity(animateIcons && isFilled ? 1.0 : 0.3) // Fade-in effect
                            .animation(.easeInOut(duration: 0.3).delay(Double(index) * 0.1), value: animateIcons)
                    }
                }
                .padding(.horizontal, 10)
            }
            //.frame(width: 200, height: 30) // Ensuring consistent width
        }
        .padding(.horizontal)
        .onAppear {
            animateIcons = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    animateIcons = true
                }
            }
        }
        .onChange(of: currentPoints) {
            animateIcons = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    animateIcons = true
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        // **Preview for health bar (Hearts) - More Spacing**
        StoryHPAndEPBarView(
            currentPoints: 3,
            maxPoints: 10,
            type: .health,
            iconSpacing: 8 // Adjust spacing for hearts
        )
        
        // **Preview for energy bar (Bolts) - Less Spacing**
        StoryHPAndEPBarView(
            currentPoints: 5,
            maxPoints: 10,
            type: .energy,
            iconSpacing: 13 // Adjust spacing for bolts
        )
    }
}

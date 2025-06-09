//
//  PlayerStatsIconDisplayView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/5/24.
//

import SwiftUI

/// A visual component that displays player stats such as Health or Energy using icon indicators.
///
/// Each stat is represented with `Image(systemName:)` icons (`heart` or `bolt`), wrapped in a capsule background.
/// Supports animation on value changes and full typography customization for the label above the bar.
///
/// Use this view in game HUDs or dashboards to give players clear, expressive feedback on their current status.
struct PlayerStatsIconDisplayView: View {
    
    // MARK: - Typography
    
    /// Base font to use if no explicit font size is set.
    var font: Font
    
    /// Font weight for the stat label.
    var fontWeight: Font.Weight
    
    /// Font width (condensed, expanded, etc.) for the stat label.
    var fontWidth: Font.Width
    
    /// Font design (e.g., serif, rounded) for the stat label.
    var fontDesign: Font.Design
    
    /// Optional custom font size for the stat label. Overrides `font` if provided.
    var fontSize: CGFloat?
    
    /// Additional spacing between characters in the stat label.
    var kerning: CGFloat
    
    /// Color for the stat label text.
    var foregroundColor: Color

    // MARK: - Data Inputs
    
    /// The current number of points (e.g., 7 out of 10 health).
    var currentPoints: Int
    
    /// The maximum possible number of points (e.g., 10 hearts or bolts).
    let maxPoints: Int
    
    /// The type of status being displayed (`.health` or `.energy`).
    var iconType: StatusBarType
    
    /// Horizontal spacing between icons in the bar.
    var iconSpacing: CGFloat
        
    // MARK: - Styling
    
    /// Background color of the capsule container.
    var capsuleColor: Color
    
    /// Icon color for filled states (e.g., `heart.fill` or `bolt.fill`).
    var iconColor: Color
    
    /// Icon color for unfilled states (e.g., `heart` or `bolt` outlines).
    var iconOutlineColor: Color
    
    // MARK: - Internal State
    
    /// Controls animation for filled icons on appear or when value changes.
    @State private var animateIcons = false
    
    /// Represents the type of stat to be displayed: health or energy.
    enum StatusBarType {
        case health
        case energy
    }
    
    // MARK: - View Body
    
    var body: some View {
        VStack {
            // Label for current stat status
            Text("\(currentPoints)/\(maxPoints) \(iconType == .health ? "Health" : "Energy")")
                .font(
                    fontSize != nil
                    ? Font.system(size: fontSize!, weight: fontWeight, design: fontDesign)
                    : font
                )
                .fontWeight(fontWeight)
                .fontWidth(fontWidth)
                .kerning(kerning)
                .foregroundColor(foregroundColor)
            
            // Stat icon bar with animated transitions
            ZStack(alignment: .center) {
                // Background capsule bar
                Capsule()
                    .fill(capsuleColor)
                    .frame(height: 30)
                
                // Animated icons (heart or bolt)
                HStack(spacing: iconSpacing) {
                    ForEach(0..<maxPoints, id: \.self) { index in
                        let isFilled = index < currentPoints
                        let icon = iconType == .health
                            ? (isFilled ? "heart.fill" : "heart")
                            : (isFilled ? "bolt.fill" : "bolt")
                        
                        let color = isFilled ? iconColor : iconOutlineColor
                        
                        Image(systemName: icon)
                            .foregroundStyle(color)
                            .font(.title2)
                            .scaleEffect(animateIcons && isFilled ? 1.2 : 1.0)
                            .opacity(animateIcons && isFilled ? 1.0 : 0.3)
                            .animation(.easeInOut(duration: 0.3).delay(Double(index) * 0.1), value: animateIcons)
                    }
                }
                .padding(.horizontal, 10)
            }
            .frame(width: 200, height: 30)
        }
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
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 20) {
            // **Preview for HP
            PlayerStatsIconDisplayView(
                font: .largeTitle,
                fontWeight: .black,
                fontWidth: .expanded,
                fontDesign: .serif,
                fontSize: 20,
                kerning: 2.5,
                foregroundColor: .white.opacity(0.9),
                currentPoints: 3,
                maxPoints: 10,
                iconType: .health,
                iconSpacing: 8,
                capsuleColor: Color.white.opacity(0.2),
                iconColor: Color.red.opacity(0.9),
                iconOutlineColor: Color.white.opacity(0.9)
            )
            
            // **Preview for EP
            PlayerStatsIconDisplayView(
                font: .largeTitle,
                fontWeight: .black,
                fontWidth: .expanded,
                fontDesign: .serif,
                fontSize: 20,
                kerning: 2.5,
                foregroundColor: .white.opacity(0.9),
                currentPoints: 5,
                maxPoints: 10,
                iconType: .energy,
                iconSpacing: 13,
                capsuleColor: Color.white.opacity(0.2),
                iconColor: Color.blue.opacity(0.9),
                iconOutlineColor: Color.white.opacity(0.9)
            )
        }
    }
}

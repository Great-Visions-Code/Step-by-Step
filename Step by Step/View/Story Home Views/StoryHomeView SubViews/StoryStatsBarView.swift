//
//  StoryStatsBarView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/5/24.
//

import SwiftUI

/// A visual indicator bar for showing player stats such as Health or Energy.
///
/// `StoryStatsBarView` presents a label and a horizontal capsule filled with icons (e.g., hearts or bolts),
/// visually representing current versus maximum values. It supports animation and custom styling for better immersion.
///
/// This view is often used in game HUDs, dashboards, or story overview screens to provide clear, immediate feedback
/// about the player’s current health or energy status.
///
/// - Note: The bar animates when the current value changes or on appear.
///
/// ## Example
/// ```swift
/// StoryStatsBarView(
///     font: .headline,
///     fontWeight: .bold,
///     fontWidth: .expanded,
///     fontDesign: .serif,
///     fontSize: 18,
///     kerning: 2.0,
///     foregroundColor: .white,
///     currentPoints: 5,
///     maxPoints: 10,
///     iconType: .health,
///     iconSpacing: 10,
///     capsuleColor: .gray.opacity(0.3),
///     iconColor: .red,
///     iconOutlineColor: .white
/// )
/// ```
struct StoryStatsBarView: View {
    
    // MARK: - Typography
    
    /// The base font used if no specific size is provided.
    var font: Font
    
    /// Font weight (e.g., `.regular`, `.bold`, `.black`).
    var fontWeight: Font.Weight
    
    /// Font width (e.g., `.standard`, `.expanded`, `.condensed`).
    var fontWidth: Font.Width
    
    /// Font design (e.g., `.serif`, `.rounded`, `.monospaced`).
    var fontDesign: Font.Design
    
    /// Optional explicit font size. If set, overrides the default `font`.
    var fontSize: CGFloat?
    
    /// Additional spacing between each character in the label text.
    var kerning: CGFloat
    
    /// Foreground color for the label text.
    var foregroundColor: Color

    // MARK: - Stat Data
    
    /// The current number of points (e.g., health or energy).
    var currentPoints: Int
    
    /// The maximum number of points possible.
    let maxPoints: Int
    
    /// The type of stat being displayed (`.health` or `.energy`).
    var iconType: StatusBarType
    
    /// Horizontal space between icons.
    var iconSpacing: CGFloat
        
    // MARK: - Styling
    
    /// Background color of the capsule container.
    var capsuleColor: Color
    
    /// Color for filled (active) icons.
    var iconColor: Color
    
    /// Color for unfilled (inactive) icons.
    var iconOutlineColor: Color
    
    // MARK: - Animation
    
    /// Controls when icons animate in or update.
    @State private var animateIcons = false
    
    /// Type of stat bar being displayed.
    enum StatusBarType {
        case health
        case energy
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            // Label showing current stat value
            Text("\(iconType == .health ? "HEALTH" : "ENERGY") \(currentPoints)/\(maxPoints) ")
                .font(
                    fontSize != nil
                    ? Font.system(size: fontSize!, weight: fontWeight, design: fontDesign)
                    : font
                )
                .fontWeight(fontWeight)
                .fontWidth(fontWidth)
                .kerning(kerning)
                .foregroundColor(foregroundColor)
            
            // Icon bar inside capsule background
            ZStack {
                Capsule()
                    .fill(capsuleColor)
                    .frame(height: 32)
                
                HStack(spacing: iconSpacing) {
                    ForEach(0..<maxPoints, id: \.self) { index in
                        let isFilled = index < currentPoints
                        let iconName = iconType == .health
                            ? (isFilled ? "heart.fill" : "heart")
                            : (isFilled ? "bolt.fill" : "bolt")
                        
                        let color = isFilled ? iconColor : iconOutlineColor
                        
                        Image(systemName: iconName)
                            .foregroundStyle(color)
                            .font(.title2)
                            .scaleEffect(animateIcons && isFilled ? 1.2 : 1.0)
                            .opacity(animateIcons && isFilled ? 1.0 : 0.3)
                            .animation(
                                .easeInOut(duration: 0.3)
                                    .delay(Double(index) * 0.1),
                                value: animateIcons
                            )
                    }
                }
                .padding(.horizontal, 10)
            }
            .frame(width: 200, height: 32)
        }
        .onAppear {
            triggerAnimation()
        }
        .onChange(of: currentPoints) {
            triggerAnimation()
        }
    }
    
    /// Triggers cascading animation when the view appears or stat value changes.
    private func triggerAnimation() {
        animateIcons = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation {
                animateIcons = true
            }
        }
    }
}

// MARK: - Preview (Minimal Component)

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack(spacing: 20) {
            StoryStatsBarView(
                font: .largeTitle,
                fontWeight: .bold,
                fontWidth: .expanded,
                fontDesign: .monospaced,
                fontSize: 18,
                kerning: 3.0,
                foregroundColor: .white.opacity(0.95),
                currentPoints: 3,
                maxPoints: 10,
                iconType: .health,
                iconSpacing: 8,
                capsuleColor: Color.white.opacity(0.3),
                iconColor: Color.red.opacity(0.95),
                iconOutlineColor: Color.white.opacity(0.95)
            )
            
            StoryStatsBarView(
                font: .largeTitle,
                fontWeight: .bold,
                fontWidth: .expanded,
                fontDesign: .monospaced,
                fontSize: 18,
                kerning: 3.0,
                foregroundColor: .white.opacity(0.95),
                currentPoints: 5,
                maxPoints: 10,
                iconType: .energy,
                iconSpacing: 14,
                capsuleColor: Color.white.opacity(0.3),
                iconColor: Color.blue.opacity(0.95),
                iconOutlineColor: Color.white.opacity(0.95)
            )
        }
    }
}

// MARK: - Preview (Contextual Integration in StoryHomeView)

#Preview {
    StoryHomeView(
        story: StoryCard(
            storyTitle: "Survive",
            storyCardImage: "SurviveStoryCardImage",
            storyCompletion: 0,
            storyDetails: "DETAILS NOT SHOWN"
        ),
        playerStatsViewModel: PlayerStatsViewModel(),
        achievementsViewModel: AchievementsViewModel(),
        storyContentViewModel: StoryContentViewModel(
            achievementsViewModel: AchievementsViewModel(),
            playerStatsViewModel: PlayerStatsViewModel()
        ),
        onNavigateButton: { _ in }
    )
}

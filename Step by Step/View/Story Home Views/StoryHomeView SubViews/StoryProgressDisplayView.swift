//
//  StoryProgressDisplayView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 2/19/25.
//

import SwiftUI

/// A view that displays the user's story progression as a percentage and visual progress bar.
///
/// This view renders a customizable completion percentage label alongside a modern linear `ProgressView`.
/// It's commonly used in views like `StoryHomeView` to give users visual feedback on how far they’ve progressed
/// through a given story.
///
/// You can customize the typography, layout spacing, and colors to match the app’s branding.
struct StoryProgressDisplayView: View {
    
    // MARK: - Properties
    
    /// ViewModel that provides real-time updates for story progress, including percentage completion.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    /// The base `Font` to use when no explicit `fontSize` is provided.
    var font: Font
    
    /// The weight of the font (e.g., `.regular`, `.bold`, `.black`).
    var fontWeight: Font.Weight
    
    /// The width of the font characters (e.g., `.standard`, `.condensed`, `.expanded`).
    var fontWidth: Font.Width
    
    /// The design of the font (e.g., `.default`, `.serif`, `.rounded`, `.monospaced`).
    var fontDesign: Font.Design
    
    /// Optional explicit font size. When set, overrides the `font` with a system font of the specified size.
    var fontSize: CGFloat?
    
    /// The amount of spacing between each character in the text.
    var kerning: CGFloat
    
    /// The color to apply to the text.
    var foregroundColor: Color
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 5) {
            /// Displays the text label for the completion percentage.
            Text("Completed: \(storyContentViewModel.completionPercentage)%")
                .font(
                    fontSize != nil
                    ? Font.system(size: fontSize!, weight: fontWeight, design: fontDesign)
                    : font
                )
                .fontWeight(fontWeight)
                .fontWidth(fontWidth)
                .kerning(kerning)
                .foregroundColor(foregroundColor)
            
            /// Displays a linear progress bar to visually represent completion.
            ProgressView(value: Double(storyContentViewModel.completionPercentage), total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.blue.opacity(0.9)))
                .frame(height: 6)
                .background(Color.white.opacity(0.15))
                .cornerRadius(3)
                .padding(.horizontal, 80)
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        StoryProgressDisplayView(
            storyContentViewModel: StoryContentViewModel(
                achievementsViewModel: AchievementsViewModel(),
                playerStatsViewModel: PlayerStatsViewModel()
            ),
            font: .largeTitle,
            fontWeight: .black,
            fontWidth: .expanded,
            fontDesign: .serif,
            fontSize: 25,
            kerning: 3.5,
            foregroundColor: .white.opacity(0.9)
        )
    }
}

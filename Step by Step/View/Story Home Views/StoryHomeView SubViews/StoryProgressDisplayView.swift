//
//  StoryProgressDisplayView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 2/19/25.
//

import SwiftUI

/// A visual indicator of the user's story progression, combining a percentage label and progress bar.
///
/// `StoryProgressDisplayView` communicates how far the user has advanced through a story.
/// It includes a customizable percentage text and a sleek linear progress bar that adapts visually
/// as progress updates.
///
/// Typically placed in `StoryHomeView`, it reinforces narrative momentum and encourages completion.
///
/// ### Example
/// ```swift
/// StoryProgressDisplayView(
///     storyContentViewModel: viewModel,
///     font: .body,
///     fontWeight: .bold,
///     fontWidth: .expanded,
///     fontDesign: .serif,
///     fontSize: 18,
///     kerning: 2.5,
///     foregroundColor: .white
/// )
/// ```
struct StoryProgressDisplayView: View {
    
    // MARK: - Dependencies
    
    /// ViewModel that publishes live updates to story completion percentage.
    @ObservedObject var storyContentViewModel: StoryContentViewModel

    // MARK: - Typography
    
    /// Fallback font if no specific size is defined.
    var font: Font
    
    /// Weight of the text label (e.g., `.regular`, `.black`, etc.).
    var fontWeight: Font.Weight
    
    /// Width variant of the font (e.g., `.expanded`, `.condensed`).
    var fontWidth: Font.Width
    
    /// Font design family (e.g., `.default`, `.serif`, `.monospaced`).
    var fontDesign: Font.Design
    
    /// Optional font size. If present, it overrides the base `font` with a system font.
    var fontSize: CGFloat?
    
    /// Letter spacing applied to the percentage text.
    var kerning: CGFloat
    
    /// Color applied to the percentage text.
    var foregroundColor: Color

    // MARK: - View Body
    
    var body: some View {
        VStack(spacing: 5) {
            // MARK: - Completion Percentage Text
            Text("\(storyContentViewModel.completionPercentage)%")
                .font(
                    fontSize != nil
                    ? Font.system(size: fontSize!, weight: fontWeight, design: fontDesign)
                    : font
                )
                .fontWeight(fontWeight)
                .fontWidth(fontWidth)
                .kerning(kerning)
                .foregroundColor(foregroundColor)
            
            // MARK: - Progress Bar
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
            fontSize: 18,
            kerning: 3.0,
            foregroundColor: .white.opacity(0.9)
        )
    }
}

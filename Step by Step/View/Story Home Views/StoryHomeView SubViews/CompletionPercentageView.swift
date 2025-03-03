//
//  CompletionPercentageView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 2/19/25.
//

import SwiftUI

struct CompletionPercentageView: View {
    // ViewModel to manage the story content.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Completed: \(storyContentViewModel.completionPercentage)%")
                .font(.title3)
                .fontWeight(.semibold)
            
            // Modern thin progress bar
            ProgressView(value: Double(storyContentViewModel.completionPercentage), total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                .frame(height: 6) // Thin sleek progress bar
                .background(Color.gray.opacity(0.3)) // Subtle background for contrast
                .cornerRadius(3) // Rounded edges for a modern look
                .padding(.horizontal, 80) // Centering the bar
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    CompletionPercentageView(storyContentViewModel: StoryContentViewModel(
        achievementsViewModel: AchievementsViewModel(),
        playerStatsViewModel: PlayerStatsViewModel()
        )
    )
}

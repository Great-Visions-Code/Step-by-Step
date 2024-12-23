//
//  StoryDayAndChapterView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

/// A view that displays the current day and chapter information for a story.
/// This provides users with a clear sense of progress and narrative context.
struct StoryDayAndChapterView: View {
    /// ViewModel to observe story content and progress.
    @ObservedObject var storyContentViewModel: StoryContentViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            if let currentChapter = storyContentViewModel.currentChapter {
                // Display the current day and total days to track user progress.
                Text("Day \(currentChapter.storyDay) out of \(storyContentViewModel.totalDays)")
                    .font(.title)
                    .fontWeight(.medium)
                
                // Title of the current chapter.
                Text("\"\(currentChapter.chapterTitle)\"")
                    .font(.title2)
                    .fontWeight(.medium)
            } else {
                // Placeholder text if no current chapter is loaded.
                Text("Day 1 out of 10")
                    .font(.title)
                    .fontWeight(.medium)
                
                Text("\"Start A Story\"")
                    .font(.title2)
                    .fontWeight(.medium)
            }
        }
    }
}

#Preview {
    StoryDayAndChapterView(
        storyContentViewModel: StoryContentViewModel()
    )
}

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
    /// The current day the player is on in the story.
    var storyDay: Int
    /// The total number of days in the story.
    var storyTotalDays: Int
    /// The title of the current chapter in the story.
    var storyChapter: String
    
    var body: some View {
        VStack(spacing: 10) {
            // Display the current day and total days to track user progress.
            Text("Day \(storyDay) out of \(storyTotalDays)")
                .font(.title)
                .fontWeight(.medium)
            
            // Title of the current chapter.
            Text("\"\(storyChapter)\"")
                .font(.title2)
                .fontWeight(.medium)
        }
    }
}

#Preview {
    StoryDayAndChapterView(
        storyDay: 3,
        storyTotalDays: 10,
        storyChapter: "Found Shelter"
    )
}

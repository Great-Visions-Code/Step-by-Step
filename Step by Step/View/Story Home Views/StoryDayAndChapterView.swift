//
//  StoryDayAndChapterView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

struct StoryDayAndChapterView: View {
    var storyDay: Int
    var storyTotalDays: Int
    var storyChapter: String
    
    var body: some View {
        // MARK: Current Day
        VStack(spacing: 10) {
            Text("Day \(storyDay) out of \(storyTotalDays)")
                .font(.title)
                .fontWeight(.medium)
            
            // MARK: Current Chapter Title
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

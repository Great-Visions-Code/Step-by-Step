//
//  StoryTitle.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/5/24.
//

import SwiftUI

struct StoryTitleView: View {
    // Story title passed to this view
    var title: String
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom, 55)
    }
}

#Preview {
    StoryTitleView(
        title: "Story Title"
    )
}

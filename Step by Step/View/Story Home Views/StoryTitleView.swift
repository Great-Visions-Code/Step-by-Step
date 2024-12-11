//
//  StoryTitle.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/5/24.
//

import SwiftUI

struct StoryTitleView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

#Preview {
    StoryTitleView(
        title: "Story Title in StoryHomeView()"
    )
}

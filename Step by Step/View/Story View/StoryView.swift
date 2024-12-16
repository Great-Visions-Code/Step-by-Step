//
//  StoryView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/9/24.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            // MARK: StoryNavigationIconsView() GV 12/15/24
            StoryNavigationIconsView()
            
            // MARK: PlayerStatsView() GV 12/15/24
            PlayerStatsView()
            
            Divider()
                .padding(.vertical, 10)
            
            // MARK: StoryChapterContentView() GV 12/15/24
            StoryChapterContentView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StoryView()
}

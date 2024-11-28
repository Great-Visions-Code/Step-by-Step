//
//  StoriesTitleCardViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

// ViewModel for managing the data displayed in the "Choose Your Adventure" section.
class StoriesTitleCardViewModel: ObservableObject {
    // A published array of `StoryTitleCard` objects representing the available stories.
    // - `@Published`: Ensures any changes to the `stories` array trigger updates in the views observing this ViewModel.
    @Published var stories: [StoryTitleCard] = [
        // Example stories displayed in "Choose Your Adventure" section
        StoryTitleCard(
            title: "Survive Step by Step",
            color: Color.green,
            completion: 15
        ),
        StoryTitleCard(
            title: "Future Adventures",
            color: Color.gray,
            completion: 0
        )
    ]
}

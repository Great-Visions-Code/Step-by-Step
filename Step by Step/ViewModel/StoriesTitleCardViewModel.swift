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
    // Ensures any changes to the `stories` array trigger updates in the views observing this ViewModel.
    @Published var stories: [StoryTitleCard] = [
        // Story's data displayed in "Choose Your Adventure" section
        StoryTitleCard(
            title: "Survive",
            color: Color.green,
            completion: 10,
            details: "In 'Survive - Step by Step', navigate a post-apocalyptic world while battling zombies and managing resources. Your choices shape your fate."
        ),
        StoryTitleCard(
            title: "Future Adventures",
            color: Color.gray,
            completion: 0,
            details: "Stay tuned for upcoming thrilling adventures that will test your strategy and creativity!"
        )
    ]
}

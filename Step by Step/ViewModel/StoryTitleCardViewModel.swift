//
//  StoryTitleCardViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// ViewModel for managing the data displayed in the "Choose Your Adventure" section.
class StoryTitleCardViewModel: ObservableObject {
    /// A published array of `StoryTitleCard` objects representing the available stories.
    /// Changes to this array will automatically update any views observing this ViewModel.
    @Published var stories: [StoryTitleCard] = [
        // MARK: - Predefined Stories

        /// "Survive" Story:
        /// A  zombie apocalypse adventure.
        StoryTitleCard(
            title: "Survive",
            color: Color.green,
            completion: 0,
            details: """
            In 'Survive,' you wake up to find your city plunged into chaos overnight. 
            A zombie apocalypse has turned your once-familiar world into a dangerous and unpredictable battleground.
            
            Your goal is to survive for 10 days and reach the evacuation center at the city's edge, where safety awaits.
            
            Over the course of 10 real-world days, you’ll face tough choices and limited resources.
            Expect a thrilling, high-stakes adventure where death lurks at every corner, from zombie attacks to starvation, 
            accidents, and hostile survivors. With multiple pathways to explore and few routes to ultimate survival, the 
            challenge will test your resolve and encourage you to take steps—both in-game and in real life—to make it out alive.
            """
        ),

        /// "Future Adventures" Placeholder:
        /// Represents upcoming stories yet to be added to the app.
        /// Encourages users to stay engaged and look forward to future updates.
        StoryTitleCard(
            title: "Future Adventures",
            color: Color.gray,
            completion: 100,
            details: """
            Stay tuned for upcoming thrilling adventures that will test your strategy!
            """
        )
    ]
}

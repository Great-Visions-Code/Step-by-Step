//
//  StoryCardViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// ViewModel for managing the data displayed in the "Choose Your Adventure" section.
///
/// This ViewModel provides the list of available stories, including metadata like title,
/// completion percentage, and details. It allows for dynamic updates to the story list and
/// supports UI responsiveness.
class StoryCardViewModel: ObservableObject {
    /// A published array of `StoryCard` objects representing the available stories.
    ///
    /// Changes to this array will automatically update any views observing this ViewModel.
    @Published var stories: [StoryCard] = [
        // MARK: - Predefined Stories

        /// "Survive" Story:
        /// A  zombie apocalypse adventure where the player's goal is to survive 10 in-game days
        /// and reach the evacuation center.
        StoryCard(
            title: "Survive",
            color: Color.green,
            completion: 0,
            details: """
            In 'Survive,' you wake up to the sound of blaring sirens and chaos outside your window. Overnight, your city has been overtaken by a zombie apocalypse, plunging your once-familiar world into danger and disarray.

            Your goal is simple yet daunting: survive for 10 in-game days and reach the evacuation center at the city's edge, where safety awaits. Each day presents new challenges, from scavenging for supplies to fending off zombies and navigating the unpredictable dangers of a collapsing society.

            This story is not just about survival—it's about taking steps to secure your fate. Literally. Your real-life steps fuel your progress in the game. The more steps you take, the more energy you earn to make critical decisions and advance through the story. But beware: impulsive choices may cost you dearly, whether it’s starvation, accidents, or hostile survivors.

            Will you make it to safety, or will you succumb to the chaos? Step into the story and find out!
            """
        ),

        /// "Future Adventures" Placeholder:
        /// Represents upcoming stories that will be added to the app in future updates.
        /// This encourages user engagement by teasing additional content.
        StoryCard(
            title: "Future Adventures",
            color: Color.gray,
            completion: 0,
            details: """
            Stay tuned for upcoming thrilling adventures that will test your strategy!
            """
        )
    ]
}

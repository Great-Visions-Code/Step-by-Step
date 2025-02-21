//
//  StoryCardViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI
import Combine

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
        // MARK: - Survive Story

        /// "Survive" Story:
        /// A zombie apocalypse adventure where the player's goal is to survive 10 in-game days
        /// and reach the evacuation center.
        StoryCard(
            title: "Survive",
            color: Color.blue,
            completion: 0,
            details: """
            In 'Survive,' you wake up to the sound of blaring sirens and chaos outside your window. Overnight, your city has been overtaken by a zombie apocalypse, plunging your once-familiar world into danger and disarray.

            Your goal is simple yet daunting: survive for 10 in-game days and reach the evacuation center at the city's edge, where safety awaits. Each day presents new challenges, from scavenging for supplies to fending off zombies and navigating the unpredictable dangers of a collapsing society.

            This story is not just about survival—it's about taking steps to secure your fate. Literally. Your real-life steps fuel your progress in the game. The more steps you take, the more energy you earn to make critical decisions and advance through the story. But beware: impulsive choices may cost you dearly, whether it’s starvation, accidents, or hostile survivors.

            Will you make it to safety, or will you succumb to the chaos? Step into the story and find out!
            """
        ),

        // MARK: - Stay Tuned Placeholder
        
        /// "Stay Tuned" Placeholder:
        /// Represents upcoming stories that will be added to the app in future updates.
        /// This encourages user engagement by teasing additional content.
        StoryCard(
            title: "Stay Tuned",
            color: Color.blue,
            completion: 0,
            details: """
            Stay tuned for upcoming thrilling adventures that will test your strategy!
            """
        )
    ]
    
    // Reference to the `StoryContentViewModel` to track the active story progress.
    private var storyContentViewModel: StoryContentViewModel?
    
    /// Initializes the ViewModel with an optional reference to `StoryContentViewModel` to track progress.
    ///
    /// - Parameter storyContentViewModel: The ViewModel managing the active story's content and progress.
    init(storyContentViewModel: StoryContentViewModel? = nil) {
        self.storyContentViewModel = storyContentViewModel
        setupCompletionTracking()
    }
    
    // MARK: - Completion Tracking

    /// Sets up a listener to dynamically update the completion percentage for stories
    /// when the `completionPercentage` in the `StoryContentViewModel` changes.
    private func setupCompletionTracking() {
        storyContentViewModel?.$completionPercentage
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newPercentage in
                self?.updateStoryCompletion(for: "Survive", to: newPercentage)
            }
            .store(in: &cancellables)
    }

    /// Updates the completion percentage for a specific story by title.
    ///
    /// If the story has a static completion (e.g., "Stay Tuned"), it remains unchanged.
    ///
    /// - Parameters:
    ///   - title: The title of the story to update.
    ///   - percentage: The new completion percentage.
    private func updateStoryCompletion(for title: String, to percentage: Int) {
        if let index = stories.firstIndex(where: { $0.title == title }) {
            // Keep static stories like "Stay Tuned" at their default completion.
            if stories[index].title == "Stay Tuned" {
                stories[index].completion = 0 // Always set to 0.
            } else {
                stories[index].completion = percentage
            }
        }
    }

    // MARK: - Private Properties

    /// A set of cancellables for managing Combine subscriptions.
    private var cancellables = Set<AnyCancellable>()
}

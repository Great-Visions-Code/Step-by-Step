//
//  SelectedStoryViewModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 2/17/25.
//

import SwiftUI

/// ViewModel for managing the selected story across views.
///
/// This ViewModel ensures that when a user selects a story from `HomeView`,
/// their selection is **persisted** across navigation updates and re-renders.
class SelectedStoryViewModel: ObservableObject {
    /// The currently selected story, observed across views.
    @Published var selectedStory: StoryCard?
}

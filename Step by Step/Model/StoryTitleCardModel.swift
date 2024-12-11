//
//  StoryTitleCardModel.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

// Properties to story options
struct StoryTitleCard: Hashable {
    let title: String
    let color: Color
    let completion: Int
    // Displayed in StoryDetailSheetView()
    let details: String
}

//
//  AttemptTrackerView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

struct AttemptTrackerView: View {
    var newStoryAttempt: Int = 3
    
    var body: some View {
        Text("Attempt #\(newStoryAttempt)")
            .font(.title2)
            .fontWeight(.bold)
    }
}

#Preview {
    AttemptTrackerView(
        newStoryAttempt: 3
    )
}

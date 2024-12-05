//
//  CurrentStepsTakenProgressView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

struct CurrentStepsTakenProgressView: View {
    // Properties (To be passed in DashboardView.swift)
    var currentStepsTaken: Int
    var totalStepsGoal: Int
    
    var body: some View {
        VStack {
            // Display Steps Taken
            Text("Steps Taken:")
                .font(.title)
                .bold()
                .padding(.bottom, 2)
            
            // TODO: Circular progress bar GV 11/22/24
            // - Total should be totalStepsGoal
            // - Progress should be tracked based on currentStepsTaken
            // Temporary placeholder for circular progress bar
            Text("\(currentStepsTaken) out of a goal of \(totalStepsGoal)")
                .font(.headline)
                .padding(.bottom)
        }
    }
}

#Preview {
    CurrentStepsTakenProgressView(
        // Sample data for preview
        currentStepsTaken: 5000,
        totalStepsGoal: 10000
    )
}

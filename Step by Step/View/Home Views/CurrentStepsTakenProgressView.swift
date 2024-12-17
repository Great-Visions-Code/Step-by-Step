//
//  CurrentStepsTakenProgressView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/25/24.
//

import SwiftUI

struct CurrentStepsTakenProgressView: View {
    var currentStepsTaken: Int
    var totalStepsGoal: Int
    
    var body: some View {
        VStack {
            Text("Steps Taken:")
                .font(.title)
                .bold()
                .padding(.bottom, 2)
            
            // TODO: Circular progress bar GV 11/22/24
            // Temporary placeholder for circular progress bar
            Text("\(currentStepsTaken) out of a goal of \(totalStepsGoal)")
                .font(.headline)
                .padding(.bottom)
        }
    }
}

#Preview {
    CurrentStepsTakenProgressView(
        currentStepsTaken: 5000,
        totalStepsGoal: 10000
    )
}

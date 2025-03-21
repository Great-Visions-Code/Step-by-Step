//
//  StepActivityView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/14/25.
//

import SwiftUI

struct StepActivityView: View {

    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            // MARK: - Steps Taken Stats View
            StepsTakenStatsView(
                stepTrackerViewModel: StepTrackerViewModel()
            )
                        
            // MARK: - Step Stats Graph View
            StepStatsGraphView(stepTrackerViewModel: StepTrackerViewModel())
        }
        .padding(.bottom, 100)
    }
}

#Preview {
    StepActivityView()
}

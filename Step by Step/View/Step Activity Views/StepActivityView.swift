//
//  StepActivityView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/14/25.
//

import SwiftUI

struct StepActivityView: View {

    var body: some View {
        VStack(spacing: 20) { // Spacing for balance
            
            // MARK: - Steps Taken Stats View
            StepsTakenStatsView()
            
            // MARK: - Step Stats Graph View
            StepStatsGraphView()
        }
        .padding()
    }
}

#Preview {
    StepActivityView()
}

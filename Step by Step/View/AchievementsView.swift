//
//  AchievementsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// View responsible for displaying the user achievements within the app,
/// including the ability to reset attempts.
struct AchievementsView: View {
    /// The ViewModel managing the achievements, including attempt tracking.
    @ObservedObject var achievementsViewModel: AchievementsViewModel

    var body: some View {
        VStack(spacing: 20) {
            // Title indicating the purpose of the view.
            Text("Achievements")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Spacer()
            
            // Display the current attempt count.
            Text("Attempt #\(achievementsViewModel.achievements.attempts)")
                .font(.title2)
                .fontWeight(.medium)

            // Button to reset the attempt count.
            Button(action: {
                achievementsViewModel.resetAttempts()
            }) {
                Text("Reset Attempts")
                    .font(.title2)
                    .bold()
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    AchievementsView(achievementsViewModel: AchievementsViewModel())
}

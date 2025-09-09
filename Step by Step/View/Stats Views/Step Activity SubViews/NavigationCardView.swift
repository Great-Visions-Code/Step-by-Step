//
//  NavigationCardView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 8/26/25.
//

import SwiftUI

/// A card-styled navigation link that matches the look of `StepsStatsCardView`.
struct NavigationCardView<Destination: View>: View {
    var title: String
    var value: String
    var subheading: String?
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(.wave3)
                    .opacity(0.25)
                    .clipShape(RoundedRectangle(cornerRadius: AppStyle.cornerRadius))
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.headline)
                            .foregroundStyle(.secondary)
                        
                        Text(value)
                            .font(.title3)
                            .bold()
                        
                        Spacer()
                        
                        if let subheading = subheading {
                            Text(subheading)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(2)
                        }
                    }
                    
                    Spacer()
    
                    Image(systemName: "chevron.right")
                }
                .padding()
            }
            .frame(height: 92)
        }
        .buttonStyle(.plain) // keeps it looking like a card, not a button
    }
}

#Preview {
    NavigationCardView(
        title: "Achievements",
        value: "View",
        subheading: nil,
        destination: AchievementsListView(
            achievementsViewModel: AchievementsViewModel(),
            stepTrackerViewModel: StepTrackerViewModel(),
            healthKitViewModel: HealthKitViewModel())
    )
}

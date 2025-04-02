//
//  StatsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// View displaying user achievements and step activity, toggleable with tab buttons.
struct StatsView: View {
    /// State to track the selected tab: Achievements or Step Activity
    @State private var selectedTab: AchievementTab = .stepActivity
    
    /// Enum for tab selection
    enum AchievementTab {
        case stepActivity
        case achievements
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {  // Ensures no extra spacing at the top
                // MARK: - Custom Segmented Control
                HStack {
                    AchievementsTabView(title: "Step Activity", isSelected: selectedTab == .stepActivity) {
                        selectedTab = .stepActivity
                    }
                    
                    AchievementsTabView(title: "Achievements", isSelected: selectedTab == .achievements) {
                        selectedTab = .achievements
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10) // Adjust as needed
                                
                // MARK: - Content Switching Based on Selected Tab
                if selectedTab == .stepActivity {
                    StepActivityView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures it fills the space
                } else {
                    AchievementsListView(
                        achievementsViewModel: AchievementsViewModel(),
                        stepTrackerViewModel: StepTrackerViewModel(),
                        healthKitViewModel: HealthKitViewModel()
                    )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // Ensures VStack fills space
            .background(Color(.systemGroupedBackground))
            .ignoresSafeArea(edges: .bottom) // Prevent extra space above tab bar
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Avoids double NavigationView issue on iPad
    }
}

#Preview {
    StatsView()
}

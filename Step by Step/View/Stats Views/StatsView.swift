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
            VStack {
                // MARK: - Custom Segmented Control
                HStack {
                    AchievementsTabView(title: "Step Activity", isSelected: selectedTab == .stepActivity) {
                        selectedTab = .stepActivity
                    }
                    
                    AchievementsTabView(title: "Achievements", isSelected: selectedTab == .achievements) {
                        selectedTab = .achievements
                    }
                }
                .padding()
                
                Divider()
                
                // MARK: - Content Switching Based on Selected Tab
                if selectedTab == .stepActivity {
                    StepActivityView()
                } else {
                    AchievementsListView()
                }
            }
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    StatsView()
}

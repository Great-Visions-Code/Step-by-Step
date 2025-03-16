//
//  AchievementsView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 11/27/24.
//

import SwiftUI

/// View displaying user achievements and step activity, toggleable with tab buttons.
struct AchievementsView: View {
    /// State to track the selected tab: Achievements or Step Activity
    @State private var selectedTab: AchievementTab = .achievements
    
    /// Enum for tab selection
    enum AchievementTab {
        case achievements
        case stepActivity
    }

    var body: some View {
        NavigationView {
            VStack {
                // MARK: - Custom Segmented Control
                HStack {
                    AchievementsTabView(title: "Achievements", isSelected: selectedTab == .achievements) {
                        selectedTab = .achievements
                    }
                    
                    AchievementsTabView(title: "Step Activity", isSelected: selectedTab == .stepActivity) {
                        selectedTab = .stepActivity
                    }
                }
                .padding()
                
                Divider()
                
                // MARK: - Content Switching Based on Selected Tab
                if selectedTab == .achievements {
                    AchievementsListView()
                } else {
                    StepActivityView()
                }
            }
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    AchievementsView()
}

//
//  StatsCardBackgroundView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 9/13/25.
//

import SwiftUI

struct StatsCardBackgroundView: View {
    var body: some View {
            // Background card with style
            Rectangle()
            .foregroundStyle(AppStyle.statsCardBackgroundColor)
            .opacity(AppStyle.statsCardOpacity)
                .clipShape(RoundedRectangle(cornerRadius: AppStyle.cornerRadius))
    }
}

#Preview {
    StatsCardBackgroundView()
}

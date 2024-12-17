//
//  StoryHomeNavigationButtonView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/8/24.
//

import SwiftUI

struct StoryHomeNavigationButtonView: View {
    var buttonText: String
    var buttonAction: (() -> Void)?
    
    var body: some View {
        Button(action: {
            buttonAction?()
        }) {
            Text(buttonText)
                .font(.title3)
                .bold()
                .padding()
                .frame(width: 250)
                .background(Color.blue)
                .foregroundStyle(.white)
                .cornerRadius(20)
        }
    }
}

#Preview {
    StoryHomeNavigationButtonView(
        buttonText: "Start New Story",
        buttonAction: {}
    )
}

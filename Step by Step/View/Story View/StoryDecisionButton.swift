//
//  StoryDecisionButton.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/15/24.
//

import SwiftUI

struct StoryDecisionButton: View {
    var body: some View {
        VStack(spacing: 10) {
            Button(action: {
                // Option 1 Action
            }) {
                Text("Option 1")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            Button(action: {
                // Option 2 Action
            }) {
                Text("Option 2")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        .padding()
    }
}

#Preview {
    StoryDecisionButton()
}

//
//  StoryMapView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 12/16/24.
//

import SwiftUI

/// Displays the story's world map, allowing users to pan and zoom.
struct StoryMapView: View {
    private let mapImage = UIImage(named: "SurviveTownMap") ?? UIImage()

    var body: some View {
        ZoomableScrollView {
            Image(uiImage: mapImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationTitle("Story Map")
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    StoryMapView()
}

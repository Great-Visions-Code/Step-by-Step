//
//  ZoomableScrollView.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 3/2/25.
//

import SwiftUI

/// A reusable scrollable and zoomable view wrapper for displaying images or content.
/// This view allows users to zoom and pan over the provided content.
struct ZoomableScrollView<Content: View>: UIViewRepresentable {
    let content: Content

    /// Initializes the zoomable scroll view with the provided content.
    /// - Parameter content: A SwiftUI view that will be embedded within the scroll view.
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    /// Creates the `UIScrollView` and embeds the SwiftUI content within it.
    /// - Parameter context: The `UIViewRepresentable` context for managing the view.
    /// - Returns: A configured `UIScrollView` instance.
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        let hostedView = UIHostingController(rootView: content).view! // Convert SwiftUI view to UIKit

        // Disable autoresizing mask constraints to use Auto Layout instead.
        hostedView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(hostedView)

        // Apply Auto Layout constraints to make the hosted view fill the scroll view.
        NSLayoutConstraint.activate([
            hostedView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostedView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostedView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostedView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostedView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),  // Ensure full width
            hostedView.heightAnchor.constraint(equalTo: scrollView.heightAnchor) // Ensure full height
        ])

        // Set zooming limits
        scrollView.minimumZoomScale = 1.0  // Default scale (100%)
        scrollView.maximumZoomScale = 4.0  // Max zoom (400%)
        scrollView.delegate = context.coordinator // Assign delegate to handle zooming

        // Center the content after layout is complete
        DispatchQueue.main.async {
            context.coordinator.centerScrollView(scrollView, hostedView: hostedView)
        }

        return scrollView
    }

    /// Updates the existing `UIScrollView` when the SwiftUI view updates.
    func updateUIView(_ uiView: UIScrollView, context: Context) {}

    /// Creates the coordinator responsible for handling zooming and centering.
    /// - Returns: A `Coordinator` instance that conforms to `UIScrollViewDelegate`.
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    /// Coordinator class to handle zooming and initial centering of the scroll view.
    class Coordinator: NSObject, UIScrollViewDelegate {
        /// Determines which view should be zoomed.
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return scrollView.subviews.first
        }

        /// Centers the content in the scroll view when it first appears.
        /// - Parameters:
        ///   - scrollView: The parent scroll view.
        ///   - hostedView: The SwiftUI content wrapped in a `UIView`.
        func centerScrollView(_ scrollView: UIScrollView, hostedView: UIView) {
            let contentSize = hostedView.frame.size
            let scrollViewSize = scrollView.bounds.size

            // Calculate offsets to center the content initially.
            let offsetX = max((contentSize.width - scrollViewSize.width) / 2, 0)
            let offsetY = max((contentSize.height - scrollViewSize.height) / 2, 0)

            // Apply the calculated offsets to start at the center.
            scrollView.contentOffset = CGPoint(x: offsetX, y: offsetY)
        }
    }
}

#Preview {
    ZoomableScrollView {
        Image(systemName: "map")
            .resizable()
            .scaledToFit()
    }
}

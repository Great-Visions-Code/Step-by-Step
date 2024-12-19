//
//  Step_by_StepApp.swift
//  Step by Step
//
//  Created by Gustavo Vazquez on 10/4/24.
//

import SwiftUI

/// The entry point for the Step by Step app, initializing the main scene and setting the root view.
@main
struct Step_by_StepApp: App {
    var body: some Scene {
        // The main window of the app displaying the DashboardView.
        WindowGroup {
            DashboardView()
        }
    }
}

//
//  Project_CountdownApp.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-01-23.
//

import SwiftUI

@main
struct Project_CountdownApp: App {
    var body: some Scene {
        WindowGroup {
            WorkRestTimerCreateView(viewModel: WorkRestTimerCreator(nameOfTimer: "Test"))
        }
    }
}

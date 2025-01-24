//
//  ContentView.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-01-23.
//

import SwiftUI

struct MainTimerScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            TimerView()
        }
        .padding()
    }
}

#Preview {
    MainTimerScreen()
}

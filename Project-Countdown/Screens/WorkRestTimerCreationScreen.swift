//
//  WorkRestTimerCreationScreen.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-03.
//

import SwiftUI

struct WorkRestTimerCreationScreen: View {
    
    @State private var timerName: String = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            VStack {
                Text("Timer Name")
                TextField("e.g. Pomodoro", text: $timerName)
                    .frame(width: UIScreen.main.bounds.width/2)
                    .background(Color.secondary)
                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
            }
            
            VStack {
                Text("Interval Name")
                TextField("e.g. Pomodoro", text: $timerName)
                    .frame(width: UIScreen.main.bounds.width/2)
                    .background(Color.secondary)
                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
                Text("Interval Length")
                HStack {
                    TextField("e.g. Pomodoro", text: $timerName)
                        .frame(width: UIScreen.main.bounds.width/5)
                        .background(Color.secondary)
                        .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
                    Text(":")
                    TextField("e.g. Pomodoro", text: $timerName)
                        .frame(width: UIScreen.main.bounds.width/5)
                        .background(Color.secondary)
                        .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
                }
            }
        }
    }
}

#Preview {
    WorkRestTimerCreationScreen()
}

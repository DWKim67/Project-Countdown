//
//  WorkRestTimerCreationScreen.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-03.
//

import SwiftUI

struct WorkRestTimerCreationScreen: View {
    
    @State private var timerName: String = ""
    @State private var intervalName: String = ""
    @State private var minuteLength: String = ""
    @State private var secondLength: String = ""
    @State private var selectedTab = 0
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                VStack {
                    Text("Timer Name")
                        .font(.largeTitle)
                    TextField("e.g. Pomodoro", text: $timerName)
                        .frame(width: UIScreen.main.bounds.width/2)
                        .background(Color.secondary)
                        .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
                    Button("Next", action: {
                        selectedTab += 1
                    })
                    .buttonStyle(.bordered)
                    .foregroundStyle(Color.white)
                }
                .tag(0)
                
                IntervalCreatorView(intervalName: $intervalName, minuteLength: $minuteLength, secondLength: $secondLength)
                .tag(1)
            }
            .tabViewStyle(.page)
            
            
            
        }
    }
}

#Preview {
    WorkRestTimerCreationScreen()
}

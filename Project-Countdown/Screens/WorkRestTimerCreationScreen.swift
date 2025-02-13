//
//  WorkRestTimerCreationScreen.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-03.
//

import SwiftUI

struct WorkRestTimerCreationScreen: View {
    
    @State private var workRestTimerName: String = ""
    @State private var selectedTab = 0
    @State private var reloadID = UUID()
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel: WorkRestTimerCreator
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                VStack {
                    Text("Timer Name")
                        .font(.largeTitle)
                    PCTextField(textInput: $workRestTimerName, textExample: "e.g. Pomodoro", textfieldSize: .large)
                }
                .tag(0)
                
                IntervalCreatorView(reloadID: $reloadID)
                    .tag(1)
                
                WorkRestTimerCreatorView()
                    .id(reloadID)
                    .tag(2)
            }
            .tabViewStyle(.page (indexDisplayMode: .never))
            .frame(height: UIScreen.main.bounds.height * 0.7)
            
            Spacer()
            
            HStack {
                Button("Back", action: {
                    if selectedTab > 0 { selectedTab -= 1 }
                })
                Button("Next", action: {
                    
                    if selectedTab < 2 {
                        if selectedTab == 0 {
                            viewModel.updateWorkRestTimerName(with: workRestTimerName)
                        }
                        selectedTab += 1
                    }
                })
            }
            .buttonStyle(.bordered)
            .foregroundStyle(Color.white)
            
            Spacer()
            
            HStack {
                ForEach(0..<3) { index in
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundStyle(selectedTab == index ? Color.white : Color.gray)
                }
            }
            .padding(.bottom, 10)
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    WorkRestTimerCreationScreen(viewModel: WorkRestTimerCreator(nameOfTimer: "Test"))
}

//
//  TimerView.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-01-23.
//

import SwiftUI

struct TimerView: View {
    @State private var totalTime: TimeInterval = 3600 // Total timer duration
    @State private var remainingTime: TimeInterval = 3600 // Remaining time
    @State private var isRunning: Bool = false
    @State private var currentTask: String = "Work"
    
    // Timer update logic
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 30) {
            // Total Timer
            Text(timeFormatted(remainingTime))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            // Sub-timer
            VStack {
                Text(currentTask)
                    .font(.title2)
                    .foregroundColor(.white)
                Text(timeFormatted(remainingTime))
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            // Visual Timer (Arc with sub-goal markers)
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 20) // Background Circle
                
                Circle()
                    .trim(from: 0, to: progressPercentage())
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(.degrees(-90)) // Rotate to start from top
                    .animation(.easeInOut, value: remainingTime)
                
                // Sub-goal markers
                ForEach(subGoalMarkers(), id: \.self) { percentage in
                    Marker(position: percentage)
                }
            }
            .frame(width: 200, height: 200)
            
            // Start/Stop Button
            Button(action: toggleTimer) {
                Text(isRunning ? "Stop" : "Start")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(width: 120, height: 50)
                    .background(isRunning ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .onReceive(timer) { _ in
            if isRunning && remainingTime > 0 {
                remainingTime -= 1
            } else {
                isRunning = false
            }
        }
    }
    
    // Function to format time into hr:min:sec
    private func timeFormatted(_ time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    // Calculate progress percentage for the arc
    private func progressPercentage() -> CGFloat {
        return CGFloat(remainingTime / totalTime)
    }
    
    // Generate sub-goal markers as percentages
    private func subGoalMarkers() -> [CGFloat] {
        // Example: 25%, 50%, 75%
        return [0.25, 0.5, 0.75]
    }
    
    // Start/Stop Timer
    private func toggleTimer() {
        isRunning.toggle()
        if !isRunning {
            remainingTime = totalTime // Reset if stopped
        }
    }
}

struct Marker: View {
    var position: CGFloat // Position of the marker as a percentage of the circle
    
    var body: some View {
        GeometryReader { geometry in
            let radius = geometry.size.width / 2
            let angle = position * 360.0
            
            Circle()
                .fill(Color.green)
                .frame(width: 10, height: 10)
                .position(x: radius * CGFloat(cos(angle * .pi / 180)) + radius,
                          y: radius * CGFloat(sin(angle * .pi / 180)) + radius)
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

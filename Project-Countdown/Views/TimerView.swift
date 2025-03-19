import SwiftUI

struct TimerView: View {
    @State private var isRunning: Bool = false
    @State private var timeLeft: TimeInterval = 0
    @State private var initialTotalTime: TimeInterval = 600  // 600 seconds = 10 minutes
    
    var body: some View {
        VStack {
            // Timer Text
            Text(timeString(from: timeLeft))
                .font(.largeTitle)
                .bold()
                .padding()
            
            // Visual Timer (Circle)
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                Circle()
                    .trim(from: 0, to: CGFloat(timeLeft / initialTotalTime))
                    .stroke(isRunning ? Color.green : Color.red, lineWidth: 10)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: timeLeft)
            }
            .frame(width: 200, height: 200)
            .padding()
            
            // Start/Stop Button
            Button(action: {
                isRunning.toggle()
                if isRunning {
                    startTimer()
                }
            }) {
                Text(isRunning ? "Stop" : "Start")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 100)
                    .background(isRunning ? Color.red : Color.green)
                    .cornerRadius(10)
            }
        }
        .onAppear {
            timeLeft = initialTotalTime
        }
    }
    
    private func timeString(from time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            guard isRunning else {
                timer.invalidate()
                return
            }
            if timeLeft > 0 {
                timeLeft -= 1
            } else {
                timer.invalidate()
                isRunning = false
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

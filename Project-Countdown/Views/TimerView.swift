import SwiftUI

struct TimerView: View {
    @State private var deadline: Date = Date().addingTimeInterval(3600 * 24) // Default to 24 hours from now
    @State private var isRunning: Bool = false
    @State private var timeLeft: TimeInterval = 0
    @State private var subGoals: [Date] = []
    @State private var showModal: Bool = false

    private var totalTime: TimeInterval {
        deadline.timeIntervalSinceNow > 0 ? deadline.timeIntervalSinceNow : 0
    }

    var body: some View {
        VStack {
            // Total Timer
            Text(timeString(from: totalTime))
                .font(.largeTitle)
                .bold()

            // Sub Timer
            VStack(spacing: 8) {
                Text("Task Name") // Placeholder for task name
                    .font(.headline)
                Text(timeString(from: totalTime / 2)) // Placeholder for sub-timer
                    .font(.subheadline)
            }

            // Visual Timer
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                Circle()
                    .trim(from: 0, to: CGFloat(totalTime > 0 ? (timeLeft / totalTime) : 0))
                    .stroke(isRunning ? Color.green : Color.red, lineWidth: 10)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 1), value: timeLeft)

                ForEach(subGoals, id: \ .self) { goal in
                    let percentage = CGFloat(deadline.timeIntervalSince(goal) / totalTime)
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(.white)
                        .offset(y: -100)
                        .rotationEffect(.degrees(Double(-360 * percentage)))
                }
            }
            .frame(width: 200, height: 200)
            .padding()

            // Start/Stop Button
            Button(action: {
                isRunning.toggle()
                if isRunning {
                    startTimer()
                } else {
                    stopTimer()
                }
            }) {
                Text(isRunning ? "Stop" : "Start")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 100)
                    .background(isRunning ? Color.red : Color.green)
                    .cornerRadius(10)
            }

            // Modal Button
            Button(action: {
                showModal.toggle()
            }) {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 30, height: 20)
                    .padding()
            }
            .sheet(isPresented: $showModal) {
                VStack {
                    Text("Modal Content") // Replace with actual content
                        .font(.headline)
                    Spacer()
                }
                .padding()
            }
        }
        .onAppear {
            timeLeft = totalTime
        }
        .onChange(of: deadline) { _ in
            timeLeft = totalTime
        }
    }

    private func timeString(from time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = (Int(time) % 3600) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            guard isRunning else {
                timer.invalidate()
                return
            }
            timeLeft -= 1
            if timeLeft <= 0 {
                timer.invalidate()
                isRunning = false
            }
        }
    }

    private func stopTimer() {
        isRunning = false
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

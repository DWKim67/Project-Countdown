//
//  WorkRestTimerCreateView.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-05.
//

import SwiftUI

struct WorkRestTimerCreateView: View {
    
    private let arrowScale: CGFloat = 0.5
    @StateObject var viewModel: WorkRestTimerCreator
    
    private func handleTimerDrop(_ intervalNames: [String]) -> Bool {
        if let name = intervalNames.first {
            guard let intervalToBeAdded = (viewModel.templateIntervals.first{ $0.name == name}) else {
                return false
            }
            viewModel.addInterval(with: intervalToBeAdded)
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.workRestTimerInterval.intervals, id: \.self) { interval in
                        TimeIntervalBlockView(timerInterval: interval)
                    }
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.red)
//                        .frame(width: 80, height: 100)
//                        .overlay {
//                            Text("Work")
//                        }
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.blue)
//                        .frame(width: 80, height: 50)
//                        .overlay {
//                            Text("Brewerwerewrwrwererwak")
//                                .padding(2)
//                        }
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.red)
//                        .frame(width: 80, height: 100)
//                        .overlay {
//                            Text("Work")
//                        }
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.red)
//                        .frame(width: 80, height: 100)
//                        .overlay {
//                            Text("Work")
//                        }
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.red)
//                        .frame(width: 80, height: 100)
//                        .overlay {
//                            Text("Work")
//                        }
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.red)
//                        .frame(width: 80, height: 100)
//                        .overlay {
//                            Text("Work")
//                        }
                }.frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.7)
            }
            .dropDestination(for: String.self) { intervals,location in
                return handleTimerDrop(intervals)
            }
            .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.7)
                .border(Color.blue, width: 2)
                
            Spacer()
            HStack (alignment: .bottom) {
                ForEach(Array(viewModel.templateIntervals), id: \.self) { interval in
                    TimeIntervalBlockView(timerInterval: interval)
                }
            }
        }
        
    }
}

#Preview {
    WorkRestTimerCreateView(viewModel: WorkRestTimerCreator(nameOfTimer: "Test"))
}

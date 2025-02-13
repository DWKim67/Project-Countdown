//
//  WorkRestTimerCreateView.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-05.
//

import SwiftUI

struct WorkRestTimerCreatorView: View {
    
    private let arrowScale: CGFloat = 0.5
    @EnvironmentObject var viewModel: WorkRestTimerCreator
    
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
                }.frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.7)
            }
            .dropDestination(for: String.self) { intervals,location in
                return handleTimerDrop(intervals)
            }
            .frame(width: UIScreen.main.bounds.width * 0.7, height: 450)
                .border(Color.blue, width: 2)
                
            Spacer()
            HStack (alignment: .bottom) {
                ForEach(Array(viewModel.templateIntervals), id: \.self) { interval in
                    TimeIntervalBlockView(timerInterval: interval)
                }
            }
        }
        .padding(.vertical, 10)
        
    }
}

#Preview {
    WorkRestTimerCreatorView()
        .environmentObject(WorkRestTimerCreator(nameOfTimer: "Test"))
}

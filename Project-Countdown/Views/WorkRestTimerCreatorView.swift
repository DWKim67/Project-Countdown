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
    @State var currentlyDragging: TimerInterval?
    @State private var isExistingTimerTargeted: Bool = false
    @State private var isEmptySpaceTargeted: Bool = false
    @State private var draggableProxyFrame: CGRect = CGRect()
    @State private var dragLocation: CGPoint = CGPoint()
    
    func shiftTimers(target: TimerInterval) {
        guard let currentlyDragging = currentlyDragging else {
            return
        }
        var index = viewModel.getIntervalIndex(of: target)
        if index == -1 || viewModel.getIntervalIndex(of: currentlyDragging) == index {
            return
        }
        if viewModel.doesDraggingIntervalExist(for: currentlyDragging) {
            viewModel.removeInterval(target: currentlyDragging)
            print("Dragging in between timers, deleting old interval")
            index -= 1
        }
        
        viewModel.insertInterval(at: index, with: currentlyDragging)
        print("Dragging in between timers, inserting dragging interval")
    }
    
    func handleEmptySpaceTargetting() {
        guard let currentlyDragging = currentlyDragging else {
            return
        }
        if !viewModel.doesDraggingIntervalExist(for: currentlyDragging) {
            viewModel.addInterval(with: currentlyDragging)
            print("Dragging in empty space, adding")
        } else if viewModel.timerIntervalCount - 1 > viewModel.getIntervalIndex(of: currentlyDragging) {
            viewModel.removeInterval(target: currentlyDragging)
            viewModel.addInterval(with: currentlyDragging)
            print("Dragging in empty space, deleting")
        }
    }
    
    func moveTimer(from source: IndexSet, to destination: Int) {
            var updatedItems = viewModel.workRestTimerInterval.intervals
            updatedItems.move(fromOffsets: source, toOffset: destination)
            viewModel.workRestTimerInterval.intervals = updatedItems
        }
    
    private func checkDropTarget() {
            Task {
                while true {
                    try await Task.sleep(nanoseconds: 200_000_000) // 0.2s delay
                    DispatchQueue.main.async {
                        print("draggableBoxArea: \(draggableProxyFrame.origin)")
                        print("dragLocation: \(dragLocation)")
                        if !isEmptySpaceTargeted && !isExistingTimerTargeted && !draggableProxyFrame.contains(dragLocation) {
                            if let currentlyDragging = currentlyDragging {
                                print("Triggered to update")
                                viewModel.removeInterval(target: currentlyDragging)
                            }
                        }
                    }
                }
            }
        }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.workRestTimerInterval.intervals, id: \.self) { interval in
                    TimeIntervalBlockView(timerInterval: interval, currentlyDragging: $currentlyDragging, dragLocation: $dragLocation, draggableProxyFrame: $draggableProxyFrame, isTemplate: true)
                        .dropDestination(for: TimerInterval.self) {items,location in
                            currentlyDragging = nil
                            dragLocation = CGPoint(x: Int(draggableProxyFrame.origin.x) + 1, y: Int(draggableProxyFrame.origin.y) + 1)
                            isExistingTimerTargeted = false
                            return false
                        } isTargeted: { status in
                            isExistingTimerTargeted = status
                            if currentlyDragging != interval {
                                shiftTimers(target: interval)
                            }
                        }
                }
            }.frame(maxWidth: UIScreen.main.bounds.width * 0.7, maxHeight: 450)
                .border(Color.blue, width: 2)
                .dropDestination(for: TimerInterval.self) {items,location in
                    currentlyDragging = nil
                    return false
                } isTargeted: { status in
                    if isExistingTimerTargeted { return }
                    isEmptySpaceTargeted = status
                    if currentlyDragging != nil {
                        handleEmptySpaceTargetting()
                    }
                }
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .onAppear {
                                draggableProxyFrame = proxy.frame(in: .global)
                                dragLocation = CGPoint(x: Int(draggableProxyFrame.origin.x) + 1, y: Int(draggableProxyFrame.origin.y) + 1)
                                checkDropTarget()
                            }
                    }
                )
            Spacer()
            HStack(alignment: .bottom) {
                ForEach(Array(viewModel.templateIntervals), id: \.self) { interval in
                    TimeIntervalBlockView(timerInterval: interval, currentlyDragging: $currentlyDragging, dragLocation: $dragLocation, draggableProxyFrame: $draggableProxyFrame)
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

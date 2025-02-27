//
//  TimeIntervalBlockView.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-10.
//

import SwiftUI

struct TimeIntervalBlockView: View {
    
    var timerInterval: TimerInterval
    @Binding var currentlyDragging: TimerInterval?
    @Binding var dragLocation: CGPoint
    @Binding var draggableProxyFrame: CGRect
    var isTemplate: Bool = false
    
    var body: some View {
        MainContent(name: timerInterval.name)
            .draggable(timerInterval) {
                MainContent(name: timerInterval.name)
                    .onAppear(perform: {
                        if isTemplate {
                            currentlyDragging = timerInterval
                        } else {
                            currentlyDragging = TimerInterval.createCopy(of: timerInterval)
                        }
                        
                    })
            }
            .gesture(DragGesture()
                .onChanged { value in
                    dragLocation = CGPoint(
                        x: draggableProxyFrame.origin.x + value.location.x,
                        y: draggableProxyFrame.origin.y + value.location.y
                    )
                })
    }
    
    private struct MainContent: View {
        var name: String
        
        var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .fill(.red)
                .frame(width: 90, height: 50)
                .overlay {
                    Text(name)
                        .padding(2)
                }
        }
    }
}

#Preview {
    TimeIntervalBlockView(timerInterval: TimerInterval(name: "Work test 1 2 3", projectTimeMultipler: 1, secondsLength: 6000), currentlyDragging: .constant(nil), dragLocation: .constant(CGPoint()), draggableProxyFrame: .constant(CGRect()))
}

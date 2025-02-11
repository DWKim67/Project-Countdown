//
//  TimeIntervalBlockView.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-10.
//

import SwiftUI

struct TimeIntervalBlockView: View {
    
    var timerInterval: TimerInterval
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.red)
            .frame(width: 90, height: 50)
            .overlay {
                Text(timerInterval.name)
                    .padding(2)
            }
            .draggable(timerInterval.name)
    }
}

#Preview {
    TimeIntervalBlockView(timerInterval: TimerInterval(name: "Work test 1 2 3", projectTimeMultipler: 1, secondsLength: 6000))
}

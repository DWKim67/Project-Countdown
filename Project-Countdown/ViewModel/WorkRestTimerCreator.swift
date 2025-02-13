//
//  WorkRestTimerCreator.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-10.
//

import SwiftUI

class WorkRestTimerCreator: ObservableObject {
    private(set) var templateIntervals: Set<TimerInterval> = []
    @Published var workRestTimerInterval: WorkRestTimer
    
    init(nameOfTimer: String) {
        self.workRestTimerInterval = WorkRestTimer(name: nameOfTimer)
//        createTemplateIntervalsForTesting()
    }
    
    func createTemplateIntervalsForTesting() {
        templateIntervals.insert(TimerInterval(name: "Work", projectTimeMultipler: 1.0, minutesLength: 25))
        templateIntervals.insert(TimerInterval(name: "Short Break", projectTimeMultipler: 0.0, minutesLength: 5))
        templateIntervals.insert(TimerInterval(name: "Long Break", projectTimeMultipler: 0.0, minutesLength: 20))
    }
    
    func addTemplateInterval(with interval: TimerInterval) {
        templateIntervals.insert(interval)
        objectWillChange.send()
    }
    
    func addInterval(with interval: TimerInterval) {
        workRestTimerInterval.addToIntervals(with: interval)
        objectWillChange.send()
    }
    
    func updateWorkRestTimerName(with name: String) {
        workRestTimerInterval.editName(to: name)
    }
    
}

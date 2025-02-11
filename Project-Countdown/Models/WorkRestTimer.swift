//
//  WorkRestTimer.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-10.
//

import Foundation

struct WorkRestTimer {
    private(set) var name: String
    private(set) var intervals: [TimerInterval] = []
    
    mutating func editName(to newName: String) {
        name = newName
    }
    
    mutating func addToIntervals(with interval: TimerInterval) {
        intervals.append(interval)
    }
    
}

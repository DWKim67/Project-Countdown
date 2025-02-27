//
//  WorkRestTimer.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-10.
//

import Foundation

struct WorkRestTimer {
    private(set) var name: String
    var intervals: [TimerInterval] = []
    
    mutating func editName(to newName: String) {
        name = newName
    }
    
    mutating func addToIntervals(with interval: TimerInterval) {
        intervals.append(interval)
    }
    
    mutating func insertInterval(at index: Int, with interval: TimerInterval) {
        if index == -1 {
            return
        }
        intervals.insert(interval, at: index)
    }
    
    func getIntervalIndex(of interval: TimerInterval) -> Int {
        intervals.firstIndex(where: {
            $0.id == interval.id
        }) ?? -1
    }
    
    mutating func removeInterval(target interval: TimerInterval) {
        let index = getIntervalIndex(of: interval)
        if (index == -1) {
            return
        }
        intervals.remove(at: index)
    }
    
}

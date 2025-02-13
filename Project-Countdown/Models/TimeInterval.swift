//
//  TimeInterval.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-10.
//

import Foundation

struct TimerInterval: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var projectTimeMultipler: Double
    var originalSecondsLength: Int
    var currentSecondsLength: Int
    
    init(name: String, projectTimeMultipler: Double, secondsLength: Int) {
        self.name = name
        self.projectTimeMultipler = projectTimeMultipler
        self.originalSecondsLength = secondsLength
        self.currentSecondsLength = secondsLength
    }
    
    init(name: String, projectTimeMultipler: Double, minutesLength: Int, secondsLength: Int) {
        self.name = name
        self.projectTimeMultipler = projectTimeMultipler
        self.originalSecondsLength = secondsLength + (minutesLength * 60)
        self.currentSecondsLength = secondsLength + (minutesLength * 60)
    }
    
    init(name: String, projectTimeMultipler: Double, minutesLength: Int) {
        self.name = name
        self.projectTimeMultipler = projectTimeMultipler
        self.originalSecondsLength = minutesLength * 60
        self.currentSecondsLength = minutesLength * 60
    }
}

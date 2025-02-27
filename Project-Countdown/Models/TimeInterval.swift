//
//  TimeInterval.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-10.
//

import Foundation
import CoreTransferable
import UniformTypeIdentifiers

struct TimerInterval: Hashable, Identifiable, Codable, Transferable {
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .timerInterval)
    }
    
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
    
    static func createCopy(of interval: TimerInterval) -> TimerInterval {
        TimerInterval(name: interval.name, projectTimeMultipler: interval.projectTimeMultipler, secondsLength: interval.originalSecondsLength)
    }
}

extension UTType {
    // exportedAs is declared in reverse domain name notation using a domain that you (or your employer) owns
    // this ensures there is only ever one owner to this kind of data
    static let timerInterval = UTType(exportedAs: "com.example.timerInterval")
}

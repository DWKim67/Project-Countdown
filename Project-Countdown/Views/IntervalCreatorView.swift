//
//  IntervalCreatorView.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-04.
//

import SwiftUI

struct IntervalCreatorView: View {
    
    @State var intervalName: String = ""
    @State var minuteLength: String = ""
    @State var secondLength: String = ""
    @Binding var reloadID: UUID
    @State var multiplierInput: String = ""
    @Environment(\.colorScheme) var colorScheme
    @State fileprivate var selectedType: WorkTypes = .workInterval
    @EnvironmentObject var viewModel: WorkRestTimerCreator
    
    var body: some View {
        VStack {
            Text("Interval Name")
            PCTextField(textInput: $intervalName, textExample: "e.g. Pomodoro", textfieldSize: .large)
            Text("Interval Length")
            HStack {
                PCTextField(textInput: $minuteLength, textExample: "e.g. 45", textfieldSize: .small)
                Text(":")
                PCTextField(textInput: $secondLength, textExample: "e.g. 30", textfieldSize: .small)
            }
            List {
                Picker("Work Type", selection: $selectedType) {
                    ForEach(WorkTypes.allCases) { option in
                        Text(String(describing: option))
                    }
                }
            }
            .frame(maxHeight: 100)
            VStack {
                Text("Multiplier")
                PCTextField(textInput: $multiplierInput, textExample: "e.g. 0.5", textfieldSize: .medium)
            }
            .hidden(selectedType != .customInterval)
            
            Button(action: {
                multiplierInput = setDefaultMultiplier()
                guard let minutesNum = Int(minuteLength), let secondsNum = Int(secondLength), let multiplierNum = Double(multiplierInput) else {
                    return
                }
                var newInterval = TimerInterval(name: intervalName, projectTimeMultipler: multiplierNum, minutesLength: minutesNum, secondsLength: secondsNum)
                viewModel.addTemplateInterval(with: newInterval)
                resetInputs()
            }, label: {
                Text("Submit")
                    .foregroundStyle(Color.primary)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                    }
            })
        }
    }
}

#Preview {
    IntervalCreatorView(reloadID: .constant(UUID()))
        .environmentObject(WorkRestTimerCreator(nameOfTimer: "Test"))
}

fileprivate enum WorkTypes: CaseIterable, Identifiable, CustomStringConvertible {
    case workInterval
    case breakInterval
    case customInterval
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .workInterval:
            "Work"
        case .breakInterval:
            "Break"
        case .customInterval:
            "Custom"
        }
    }
}

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

extension IntervalCreatorView {
    func setDefaultMultiplier() -> String {
        switch selectedType {
        case .workInterval:
            "0"
        case .breakInterval:
            "1.0"
        case .customInterval:
            multiplierInput
        }
    }
    
    func resetInputs() {
        intervalName = ""
        multiplierInput = ""
        minuteLength = ""
        secondLength = ""
        reloadID = UUID()
    }
}

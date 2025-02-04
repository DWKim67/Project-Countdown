//
//  IntervalCreatorView.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-04.
//

import SwiftUI

struct IntervalCreatorView: View {
    
    @Binding var intervalName: String
    @Binding var minuteLength: String
    @Binding var secondLength: String
    @Environment(\.colorScheme) var colorScheme
    @State var isChecked: Bool = false
    
    var body: some View {
        VStack {
            Text("Interval Name")
            TextField("e.g. Pomodoro", text: $intervalName)
                .frame(width: UIScreen.main.bounds.width/2)
                .background(Color.secondary)
                .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
            Text("Interval Length")
            HStack {
                TextField("e.g. 45", text: $minuteLength)
                    .frame(width: UIScreen.main.bounds.width/5)
                    .background(Color.secondary)
                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
                Text(":")
                TextField("e.g. 30", text: $secondLength)
                    .frame(width: UIScreen.main.bounds.width/5)
                    .background(Color.secondary)
                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
            }
//            Toggle(isOn: $isChecked) {
//                Text("Test")
//            }
        }
    }
}

#Preview {
    IntervalCreatorView(intervalName: .constant(""), minuteLength: .constant(""), secondLength: .constant(""))
}

//
//  PCTextField.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-13.
//

import SwiftUI

struct PCTextField: View {
    
    @Binding var textInput: String
    var textExample: String
    @Environment(\.colorScheme) var colorScheme
    var textfieldSize: Sizes
    
    var body: some View {
        TextField(textExample, text: $textInput)
            .frame(width: textfieldSize.sizeOfTemplate)
            .background(Color.secondary)
            .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
    }
    
    enum Sizes {
        case large
        case medium
        case small
        
        var sizeOfTemplate: CGFloat {
            switch self {
            case .large:
                UIScreen.main.bounds.width/2
            case .medium:
                UIScreen.main.bounds.width/4
            case .small:
                UIScreen.main.bounds.width/5
            }
        }
    }
}

#Preview {
    PCTextField(textInput: .constant(""), textExample: "e.g. Pomodoro", textfieldSize: .large)
}

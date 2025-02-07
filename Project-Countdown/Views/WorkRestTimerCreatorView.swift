//
//  WorkRestTimerCreateView.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-05.
//

import SwiftUI

struct WorkRestTimerCreateView: View {
    var body: some View {
        VStack {
            LoopArrowShape(lengthMultiplier: 15)
                .frame(height:150)
                .scaleEffect(0.5)
            HStack {
                Text("Work")
                    .padding(.horizontal, 35)
                    .padding(.vertical, 2)
                    .background {
                        Color.red
                    }
                    .cornerRadius(2)
                Text("Break")
                    .padding(.horizontal, 5)
                    .padding(.vertical, 2)
                    .background {
                        Color.blue
                    }
                    .cornerRadius(2)
            }
        }
        
        
        
    }
}

#Preview {
    WorkRestTimerCreateView()
}

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

//
//  LoopArrowView.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-07.
//

import SwiftUI

struct LoopArrowView: View {
    
    var lengthMultiplier: CGFloat = 1
    var label: String = "4x"
    
    var body: some View {
        HStack {
            Text("\(label)")
                .font(.largeTitle)
            LoopArrowShape(lengthMultiplier: lengthMultiplier)
                .frame(width: 160 + (10 * lengthMultiplier), height: 80)
                .rotationEffect(.degrees(-90))

        }
        
    }
}

#Preview {
    LoopArrowView()
}

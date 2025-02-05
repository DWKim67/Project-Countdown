//
//  LoopArrowShape.swift
//  Project-Countdown
//
//  Created by Daniel Kim on 2025-02-05.
//

import SwiftUI

struct LoopArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.width * 0.1 , y: rect.height * 0.3))
        path.addLine(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.3))
        path.addLine(to: CGPoint(x: rect.width * 0.2, y: rect.height * 0.4))
        path.move(to: CGPoint(x: rect.width * 0.15 , y: rect.height * 0.3))
        path.addArc(tangent1End: CGPoint(x: rect.width * 0.15 , y: rect.height * 0.2), tangent2End: CGPoint(x: rect.width * 0.3, y: rect.height * 0.2), radius: 50)
        path.addLine(to: CGPoint(x: rect.width * 0.6, y: rect.height * 0.2))
        path.addArc(tangent1End: CGPoint(x: rect.width * 0.7 , y: rect.height * 0.2), tangent2End: CGPoint(x: rect.width * 0.65, y: rect.height * 0.3), radius: 50)
        path.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.3))
//        path.addArc(tangent1End: CGPoint(x: rect.width * 0.7 , y: rect.height * 0.2), tangent2End: CGPoint(x: rect.width * 0.65, y: rect.height * 0.3), radius: 50)
        
        //        path.addArc(center: CGPoint(x: rect.width * 0.2, y: rect.height * 0.3), radius: 60, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
        return path
    }
    
    
}

#Preview {
    LoopArrowShape()
}

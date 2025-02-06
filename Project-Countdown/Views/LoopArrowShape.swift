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
        let startingPoint = CGPoint(x: 10, y: 200)
        let sizeMultiplier: CGFloat = 40
        
        path.move(to: startingPoint)
        path.addLine(to: CGPoint(x: startingPoint.x + (2 * sizeMultiplier), y: startingPoint.y))
        path.addLine(to: CGPoint(x: startingPoint.x + (1 * sizeMultiplier), y: startingPoint.y + (1 * sizeMultiplier)))
        path.move(to: CGPoint(x: startingPoint.x + (0.5 * sizeMultiplier), y: startingPoint.y))
        path.addArc(tangent1End: CGPoint(x: startingPoint.x + (0.5 * sizeMultiplier), y: startingPoint.y - (1 * sizeMultiplier)), tangent2End: CGPoint(x: startingPoint.x + (20 * sizeMultiplier), y: startingPoint.y - (1 * sizeMultiplier)), radius: (1 * sizeMultiplier))
        path.addLine(to: CGPoint(x: startingPoint.x + (0.5 * sizeMultiplier), y: startingPoint.y - (1 * sizeMultiplier)))
        path.addArc(tangent1End: CGPoint(x: startingPoint.x + (7 * sizeMultiplier) , y: startingPoint.y - (1 * sizeMultiplier)), tangent2End: CGPoint(x: startingPoint.x + (7 * sizeMultiplier), y: startingPoint.y), radius: (1 * sizeMultiplier))
        path.addLine(to: CGPoint(x: startingPoint.x + (6 * sizeMultiplier), y: startingPoint.y))
        path.addArc(tangent1End: CGPoint(x: startingPoint.x + (5 * sizeMultiplier), y: startingPoint.y - (0.5 * sizeMultiplier)), tangent2End: CGPoint(x: startingPoint.x + (4.5 * sizeMultiplier), y: startingPoint.y - (0.5 * sizeMultiplier)), radius: (4 * sizeMultiplier))
        path.addLine(to: CGPoint(x: startingPoint.x + (3.5 * sizeMultiplier), y: startingPoint.y - (0.5 * sizeMultiplier)))
        path.addLine(to: CGPoint(x: startingPoint.x + (2.5 * sizeMultiplier), y: startingPoint.y - (0.5 * sizeMultiplier)))
        path.addArc(tangent1End: CGPoint(x: startingPoint.x + (1.5 * sizeMultiplier) , y: startingPoint.y), tangent2End: CGPoint(x: startingPoint.x + (1.5 * sizeMultiplier), y: startingPoint.y), radius: (1 * sizeMultiplier))
        return path
    }
    
    
}

#Preview {
    LoopArrowShape()
}

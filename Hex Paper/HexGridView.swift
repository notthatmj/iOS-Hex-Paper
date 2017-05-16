//
//  HexGridView.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/19/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

@IBDesignable
class HexGridView: UIView {

    // The heigh and width here we chosen because, when translated to PDF coordinates, I believe they'll
    // translate to an 8.5 x 11 piece of paper. But the choice is pretty arbitrary for the moment.
    override var intrinsicContentSize: CGSize { return CGSize(width: 612, height: 792)}

    override func draw(_ rect: CGRect) {
        // This is basically just some placeholder code for now. All it does is draw a single hex
        // in the middle of the view.
        let centerX = rect.midX
        let centerY = rect.midY
        let radius = CGFloat(10)
        let angleIncrement = (2*Float.pi)/6
        let initialAngle = Float(0)
        let initialX = centerX + CGFloat(cos(initialTheta))*radius
        let initialY = centerY + CGFloat(sin(initialTheta))*radius
        let initialPoint = CGPoint(x: initialX, y: initialY)
        
        let hexPath = UIBezierPath()
        hexPath.move(to:initialPoint)
        
        for i in 1...5 {
            let angle = initialTheta + angleIncrement * Float(i)
            let nextX = centerX + CGFloat(cos(angle)) * radius
            let nextY = centerY + CGFloat(sin(angle)) * radius
            let nextPoint = CGPoint(x: nextX, y:nextY)
            hexPath.addLine(to: nextPoint)
        }
        hexPath.close()
        UIColor.gray.setStroke()
        hexPath.stroke()
    }
}

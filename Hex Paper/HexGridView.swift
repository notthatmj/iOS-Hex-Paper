//
//  HexGridView.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/19/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

struct Hex {
    var left: CGPoint?
    var topLeft: CGPoint?
    var topRight: CGPoint?
    var right: CGPoint?
    var bottomRight: CGPoint?
    var bottomLeft: CGPoint?
}

@IBDesignable
class HexGridView: UIView {

    // The heigh and width here we chosen because, when translated to PDF coordinates, I believe they'll
    // translate to an 8.5 x 11 piece of paper. But the choice is pretty arbitrary for the moment.
    override var intrinsicContentSize: CGSize { return CGSize(width: 612, height: 792)}
    
    override func draw(_ rect: CGRect) {
        // Draw hex in the top left of the screen
        let radius: Double = 20
        let initialCenter = CGPoint(x: radius, y: radius*cos(Double.pi/6))
        var initialHex = Hex()
        initialHex.right = CGPoint(x: Double(initialCenter.x)+radius*cos((2*Double.pi/6)*0),
                                   y: Double(initialCenter.y)+radius*sin((2*Double.pi / 6)*0))
        initialHex.bottomRight = CGPoint(x: Double(initialCenter.x)+radius*cos((2*Double.pi/6)*1),
                                         y: Double(initialCenter.y)+radius*sin((2*Double.pi / 6)*1))
        initialHex.bottomLeft = CGPoint(x: Double(initialCenter.x)+radius*cos((2*Double.pi / 6)*2),
                                        y: Double(initialCenter.y)+radius*sin((2*Double.pi / 6)*2))
        initialHex.left = CGPoint(x: Double(initialCenter.x)+radius*cos((2*Double.pi/6)*3),
                                  y: Double(initialCenter.y)+radius*sin((2*Double.pi / 6)*3))
        initialHex.topLeft = CGPoint(x: Double(initialCenter.x)+radius*cos((2*Double.pi/6)*4),
                                     y: Double(initialCenter.y)+radius*sin((2*Double.pi / 6)*4))
        initialHex.topRight = CGPoint(x: Double(initialCenter.x)+radius*cos((2*Double.pi/6)*5),
                                     y: Double(initialCenter.y)+radius*sin((2*Double.pi / 6)*5))

        let hexPath = UIBezierPath()
        hexPath.move(to:initialHex.right!)
        hexPath.addLine(to: initialHex.bottomRight!)
        hexPath.addLine(to: initialHex.bottomLeft!)
        hexPath.addLine(to: initialHex.left!)
        hexPath.addLine(to: initialHex.topLeft!)
        hexPath.addLine(to: initialHex.topRight!)
        hexPath.close()

        UIColor.gray.setStroke()
        hexPath.stroke()

    }
}

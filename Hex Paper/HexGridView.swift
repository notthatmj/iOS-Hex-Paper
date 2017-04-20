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

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY+20))
        UIColor.green.setStroke()
        path.stroke()
    }
}

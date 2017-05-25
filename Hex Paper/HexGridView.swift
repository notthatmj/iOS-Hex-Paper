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

    // We just draw a small line for now, to orient ourselves while panning and zooming.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY+20))
        UIColor.green.setStroke()
        path.stroke()
    }
}

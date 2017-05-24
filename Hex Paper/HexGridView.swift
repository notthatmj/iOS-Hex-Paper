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
        let hexGrid = HexGrid(rows: 1, columns: 2, hexRadius: 40.0)
        let hexPath = UIBezierPath()
        for edge in hexGrid.edges {
            let vertexSequence = Array(edge.vertices)
            let point1 = CGPoint(x: vertexSequence[0].x, y: vertexSequence[0].y)
            let point2 = CGPoint(x: vertexSequence[1].x, y: vertexSequence[1].y)
            hexPath.move(to: point1)
            hexPath.addLine(to: point2)
        }
        UIColor.gray.setStroke()
        hexPath.stroke()
    }
}

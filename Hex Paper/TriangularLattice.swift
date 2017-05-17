//
//  TriangularLattice.swift
//  Hex Paper
//
//  Created by Michael Johnson on 5/17/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

class Vertex {
    let x: Double
    let y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

class TriangularLattice {
    
    var hexRadius: Double
    
    init(edgeLength: Double) {
        self.hexRadius = edgeLength
    }
    
    func vertexAt(row: Int, column: Int) -> Vertex {
        if row % 2 == 0 {
            return Vertex(x: hexRadius * 0.5 + hexRadius * Double(column), y:Double(row) * sin(Double.pi / 3) * hexRadius)
        } else {
            return Vertex(x: hexRadius * Double(column), y: Double(row) * sin(Double.pi / 3) * hexRadius)
        }
    }
}

//
//  TriangularLattice.swift
//  Hex Paper
//
//  Created by Michael Johnson on 5/17/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

struct Vertex: Hashable {
    
    let x: Double
    let y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    var hashValue: Int {
        return x.hashValue ^ y.hashValue
    }
    
    static func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

struct TriangularLattice {
    
    let edgeLength: Double
    
    init(edgeLength: Double) {
        self.edgeLength = edgeLength
    }
    
    func vertexAt(row: Int, column: Int) -> Vertex {
        let rowHeight = sin(Double.pi / 3) * edgeLength
        let y = Double(row) * rowHeight
        let leftInset = row % 2 == 0 ? 0.5 * edgeLength : 0
        let x = leftInset + edgeLength * Double(column)
        return Vertex(x: x, y: y)
    }
}

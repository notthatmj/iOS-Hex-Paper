//
//  HexGrid.swift
//  Hex Paper
//
//  Created by Michael Johnson on 5/16/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

struct HexGrid {
    let edges: Set<Set<Vertex>>
    
    init(rows: Int, columns: Int, hexRadius: Double) {
        let lattice = TriangularLattice(edgeLength: hexRadius)
        let leftVertex = lattice.vertexAt(row: 1, column: 0)
        let topLeftVertex = lattice.vertexAt(row: 0, column: 0)
        let topRightVertex = lattice.vertexAt(row: 0, column: 1)
        let bottomLeftVertex = lattice.vertexAt(row: 2, column: 0)
        let bottomRightVertex = lattice.vertexAt(row: 2, column: 1)
        let rightVertex = lattice.vertexAt(row: 1, column: 2)
        
        edges = Set( [Set( [leftVertex, topLeftVertex]),
                      Set( [topLeftVertex, topRightVertex]),
                      Set( [topRightVertex, rightVertex]),
                      Set( [leftVertex, bottomLeftVertex]),
                      Set( [bottomLeftVertex, bottomRightVertex]),
                      Set( [bottomRightVertex, rightVertex]),
                      ])
    }
}

//
//  HexGrid.swift
//  Hex Paper
//
//  Created by Michael Johnson on 5/16/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

struct Edge: Hashable {
    let vertices: Set<Vertex>
    
    init(_ v1: Vertex, _ v2: Vertex ) {
        vertices = Set([v1,v2])
    }
    
    var hashValue: Int {
        return vertices.hashValue
    }
    
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.vertices == rhs.vertices
    }
}

struct HexGrid {
    let edges: Set<Edge>
    
    init(rows: Int, columns: Int, hexRadius: Double) {
        
        let lattice = TriangularLattice(edgeLength: hexRadius)
        let firstHexEdges = HexGrid.edgesForHexWith(centerVertexRow: 1, centerVertexColumn: 1, with: lattice)
        var secondHexEdges: Set<Edge> = Set()
        if rows != 1 || columns != 1 {
            secondHexEdges = HexGrid.edgesForHexWith(centerVertexRow: 2,
                                                     centerVertexColumn: 2,
                                                     with: lattice)
        }
        edges = firstHexEdges.union(secondHexEdges)
    }

    static func edgesForHexWith(centerVertexRow: Int,
                                centerVertexColumn: Int,
                                with lattice: TriangularLattice) -> Set<Edge> {

        var columnOffset = 0
        if centerVertexRow % 2 == 0 {
            columnOffset = 1
        }
        
        let leftVertex = lattice.vertexAt(row: centerVertexRow, column: centerVertexColumn - 1)
        let topLeftVertex = lattice.vertexAt(row: centerVertexRow - 1, column: centerVertexColumn - 1 + columnOffset)
        let topRightVertex = lattice.vertexAt(row: centerVertexRow - 1, column: centerVertexColumn + columnOffset)
        let bottomLeftVertex = lattice.vertexAt(row: centerVertexRow + 1, column: centerVertexColumn - 1 + columnOffset)
        let bottomRightVertex = lattice.vertexAt(row: centerVertexRow + 1, column: centerVertexColumn + columnOffset)
        let rightVertex = lattice.vertexAt(row: centerVertexRow, column: centerVertexColumn + 1)
        
        return Set( [Edge(leftVertex, topLeftVertex),
                     Edge(topLeftVertex, topRightVertex),
                     Edge(topRightVertex, rightVertex),
                     Edge(leftVertex, bottomLeftVertex),
                     Edge(bottomLeftVertex, bottomRightVertex),
                     Edge(bottomRightVertex, rightVertex),
                     ])
    }
}

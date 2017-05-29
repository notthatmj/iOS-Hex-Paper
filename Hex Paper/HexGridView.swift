//
//  HexGridView.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/19/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

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
        
        var edgesArray = Array<Edge>()
        for rowIndex in 0..<rows  {
            for columnIndex in 0..<columns {
                let vertexRow = HexGrid.vertexRowForHexAt(rowIndex: rowIndex, columnIndex: columnIndex)
                let vertexColumn = HexGrid.vertexColumnForHexAt(rowIndex: rowIndex, columnIndex: columnIndex)
                edgesArray.append(contentsOf: HexGrid.edgesForHexWith(centerVertexRow: vertexRow,
                                                                      centerVertexColumn: vertexColumn,
                                                                      with: lattice))
            }
        }
        self.edges = Set(edgesArray)
    }
    
    static func vertexRowForHexAt(rowIndex: Int, columnIndex: Int) -> Int {
        var vertexRow: Int
        if columnIndex % 2 == 0 {
            vertexRow = 1 + 2 * rowIndex
        } else {
            vertexRow = 2 + 2 * rowIndex
        }
        return vertexRow
    }
    
    static func vertexColumnForHexAt(rowIndex: Int, columnIndex: Int) -> Int {
        var vertexColumn: Int
        if columnIndex % 2 == 0 {
            vertexColumn = 1 + 3 * columnIndex / 2
        } else {
            vertexColumn = 2 + 3 * (columnIndex - 1) / 2
        }
        return vertexColumn
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

@IBDesignable
class HexGridView: UIView {
    
    @IBInspectable var hexRadius: CGFloat = 10.0

    override func draw(_ rect: CGRect) {
        // Calculate minimum number of hex rows and columns needed to cover
        // By drawing a diagram, we can see that
        //      gridWidth = .5 * hexRadius + 1.5 * hexRadius * numberOfHexColumns
        // So if we want to cover boundsWidth, we need
        //     numberOfHexColumns >= (boundsWidth - 0.5 * hexRadius ) / (1.5 * hexRadius)
        let boundsWidth = self.bounds.size.width
        let columns = Int(ceil((boundsWidth - 0.5 * hexRadius ) / (1.5 * hexRadius)))
        
        let hexHeight = 2 * sin(CGFloat.pi / 3) * hexRadius
        let boundsHeight = self.bounds.size.height
        let rows = Int(ceil(boundsHeight / hexHeight))
        
        let hexGrid = HexGrid(rows: rows, columns: columns, hexRadius: Double(self.hexRadius))
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

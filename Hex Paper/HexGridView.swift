//
//  HexGridView.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/19/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

extension CGPoint: Hashable {
    public var hashValue: Int {
        return x.hashValue ^ y.hashValue
    }
}

fileprivate struct TriangularLattice {
    
    let edgeLength: Double
    
    init(edgeLength: Double) {
        self.edgeLength = edgeLength
    }
    
    func pointAt(row: Int, column: Int) -> CGPoint {
        let rowHeight = sin(Double.pi / 3) * edgeLength
        let y = Double(row) * rowHeight
        let leftInset = row % 2 == 0 ? 0.5 * edgeLength : 0
        let x = leftInset + edgeLength * Double(column)
        return CGPoint(x: x, y: y)
    }
}

struct Edge: Hashable {
    let points: Set<CGPoint>
    
    init(_ p1: CGPoint, _ p2: CGPoint ) {
        points = Set([p1,p2])
    }
    
    var hashValue: Int {
        return points.hashValue
    }
    
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.points == rhs.points
    }
}

struct HexGrid {
    let edges: Set<Edge>
    
    init(rows: Int, columns: Int, hexRadius: Double) {
        
        let lattice = TriangularLattice(edgeLength: hexRadius)
        
        var accumulatedEdges = Array<Edge>()
        for rowIndex in 0..<rows  {
            for columnIndex in 0..<columns {
                let pointRow = HexGrid.centerPointRowForHexAt(rowIndex: rowIndex, columnIndex: columnIndex)
                let pointColumn = HexGrid.centerPointColumnForHexAt(rowIndex: rowIndex, columnIndex: columnIndex)
                accumulatedEdges.append(contentsOf: HexGrid.edgesForHexWith(centerPointRow: pointRow,
                                                                            centerPointColumn: pointColumn,
                                                                            with: lattice))
            }
        }
        self.edges = Set(accumulatedEdges)
    }
    
    init(width: Double, height: Double, hexRadius: Double) {
        // Calculate minimum number of hex rows and columns needed to cover the view
        // If you draw a diagram, its not hard to see that
        //      gridWidth = .5 * hexRadius + 1.5 * hexRadius * numberOfHexColumns
        // So if we want to cover boundsWidth, we need
        //     numberOfHexColumns >= (boundsWidth - 0.5 * hexRadius ) / (1.5 * hexRadius)

        let columns = max(1, Int(ceil((width - 0.5 * hexRadius ) / (1.5 * hexRadius))))
        let hexHeight = 2 * sin(Double.pi / 3) * hexRadius
        let rows = max(1, Int(ceil(height / hexHeight)))
        
        self.init(rows: rows, columns: columns, hexRadius: hexRadius)
        
    }
    
    private static func centerPointRowForHexAt(rowIndex: Int, columnIndex: Int) -> Int {
        var pointRow: Int
        if columnIndex % 2 == 0 {
            pointRow = 1 + 2 * rowIndex
        } else {
            pointRow = 2 + 2 * rowIndex
        }
        return pointRow
    }
    
    private static func centerPointColumnForHexAt(rowIndex: Int, columnIndex: Int) -> Int {
        var pointColumn: Int
        if columnIndex % 2 == 0 {
            pointColumn = 1 + 3 * columnIndex / 2
        } else {
            pointColumn = 2 + 3 * (columnIndex - 1) / 2
        }
        return pointColumn
    }
    
    private static func edgesForHexWith(centerPointRow: Int,
                                centerPointColumn: Int,
                                with lattice: TriangularLattice) -> Set<Edge> {
        
        var columnOffset = 0
        if centerPointRow % 2 == 0 {
            columnOffset = 1
        }
        
        let leftVertex = lattice.pointAt(row: centerPointRow, column: centerPointColumn - 1)
        let topLeftVertex = lattice.pointAt(row: centerPointRow - 1, column: centerPointColumn - 1 + columnOffset)
        let topRightVertex = lattice.pointAt(row: centerPointRow - 1, column: centerPointColumn + columnOffset)
        let bottomLeftVertex = lattice.pointAt(row: centerPointRow + 1, column: centerPointColumn - 1 + columnOffset)
        let bottomRightVertex = lattice.pointAt(row: centerPointRow + 1, column: centerPointColumn + columnOffset)
        let rightVertex = lattice.pointAt(row: centerPointRow, column: centerPointColumn + 1)
        
        return Set([Edge(leftVertex, topLeftVertex),
                    Edge(topLeftVertex, topRightVertex),
                    Edge(topRightVertex, rightVertex),
                    Edge(leftVertex, bottomLeftVertex),
                    Edge(bottomLeftVertex, bottomRightVertex),
                    Edge(bottomRightVertex, rightVertex)
                    ])
    }
}

@IBDesignable
class HexGridView: UIView {
    
    @IBInspectable var hexRadius: CGFloat = 10.0
    @IBInspectable var gridColor: UIColor = .gray
    
    override func draw(_ rect: CGRect) {
        let hexGrid = HexGrid(width: Double(self.bounds.size.width),
                              height: Double(self.bounds.size.height),
                              hexRadius: Double(self.hexRadius))
        let hexPath = UIBezierPath()
        for edge in hexGrid.edges {
            let points = Array(edge.points)
            hexPath.move(to: points[0])
            hexPath.addLine(to: points[1])
        }
        gridColor.setStroke()
        hexPath.stroke()
    }
}

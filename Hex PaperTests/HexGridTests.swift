//
//  HexGridTests.swift
//  Hex Paper
//
//  Created by Michael Johnson on 5/16/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Hex_Paper

class HexGridTests: XCTestCase {
    
    func testHexGridWithSingleHex() {
        let hexRadius = 10.0
        let SUT = HexGrid(rows: 1, columns: 1, hexRadius: hexRadius)
        let rowHeight = sin(Double.pi / 3) * hexRadius
        
        XCTAssertEqual(SUT.edges.count, 6)
        let leftVertex = Vertex(x: 0, y: rowHeight)
        let topLeftVertex = Vertex(x: 0.5*hexRadius, y: 0)
        let topLeftEdge = Edge(leftVertex, topLeftVertex)
        XCTAssert(SUT.edges.contains(topLeftEdge))
        
        let topRightVertex = Vertex(x: 1.5*hexRadius, y: 0)
        let topEdge = Edge(topLeftVertex, topRightVertex)
        XCTAssert(SUT.edges.contains(topEdge))
        
        let rightVertex = Vertex(x: 2*hexRadius, y: rowHeight)
        let topRightEdge = Edge(topRightVertex, rightVertex)
        XCTAssert(SUT.edges.contains(topRightEdge))
        
        let bottomLeftVertex = Vertex(x: 0.5*hexRadius, y: 2*rowHeight)
        let bottomLeftEdge = Edge(leftVertex, bottomLeftVertex)
        XCTAssert(SUT.edges.contains(bottomLeftEdge))
        
        let bottomRightVertex = Vertex(x: 1.5*hexRadius, y: 2*rowHeight)
        let bottomEdge = Edge(bottomLeftVertex, bottomRightVertex)
        XCTAssert(SUT.edges.contains(bottomEdge))
        
        let bottomRightEdge = Edge(bottomRightVertex, rightVertex)
        XCTAssert(SUT.edges.contains(bottomRightEdge))
    }
    
    func test1by2HexGrid() {
        let hexRadius = 10.0
        let SUT = HexGrid(rows: 1, columns: 2, hexRadius: hexRadius)
        let rowHeight = sin(Double.pi / 3) * hexRadius
        
        let v1 = Vertex(x: 0.5 * hexRadius, y:0 )
        let v2 = Vertex(x: 1.5 * hexRadius, y:0 )
        let v3 = Vertex(x: 0, y: rowHeight)
        let v4 = Vertex(x: 2 * hexRadius, y: rowHeight)
        let v5 = Vertex(x: 3 * hexRadius, y: rowHeight)
        let v6 = Vertex(x: 0.5 * hexRadius, y: 2 * rowHeight)
        let v7 = Vertex(x: 1.5 * hexRadius, y: 2 * rowHeight)
        let v8 = Vertex(x: 3.5 * hexRadius, y: 2 * rowHeight)
        let v9 = Vertex(x: 2 * hexRadius, y: 3 * rowHeight)
        let v10 = Vertex(x: 3 * hexRadius, y: 3 * rowHeight)

        let e1 = Edge(v3, v1)
        let e2 = Edge(v1, v2)
        let e3 = Edge(v2, v4)
        let e4 = Edge(v4, v5)
        let e5 = Edge(v3, v6)
        let e6 = Edge(v6, v7)
        let e7 = Edge(v7, v4)
        let e8 = Edge(v5, v8)
        let e9 = Edge(v7, v9)
        let e10 = Edge(v9, v10)
        let e11 = Edge(v10, v8)
        
        XCTAssertEqual(SUT.edges.count, 11)
        XCTAssert(SUT.edges.contains(e1))
        XCTAssert(SUT.edges.contains(e2))
        XCTAssert(SUT.edges.contains(e3))
        XCTAssert(SUT.edges.contains(e4))
        XCTAssert(SUT.edges.contains(e5))
        XCTAssert(SUT.edges.contains(e6))
        XCTAssert(SUT.edges.contains(e7))
        XCTAssert(SUT.edges.contains(e8))
        XCTAssert(SUT.edges.contains(e9))
        XCTAssert(SUT.edges.contains(e10))
        XCTAssert(SUT.edges.contains(e11))
    }
    
    func test2by2HexGrid() {
        let hexRadius = 10.0
        let SUT = HexGrid(rows: 2, columns: 2, hexRadius: hexRadius)
        let rowHeight = sin(Double.pi / 3) * hexRadius
        
        let v1 = Vertex(x: 0.5 * hexRadius, y:0 )
        let v2 = Vertex(x: 1.5 * hexRadius, y:0 )

        let v5 = Vertex(x: 0, y: rowHeight)
        let v6 = Vertex(x: 2 * hexRadius, y: rowHeight)
        let v7 = Vertex(x: 3 * hexRadius, y: rowHeight)
        let v10 = Vertex(x: 0.5 * hexRadius, y: 2 * rowHeight)
        let v11 = Vertex(x: 1.5 * hexRadius, y: 2 * rowHeight)
        let v12 = Vertex(x: 3.5 * hexRadius, y: 2 * rowHeight)
        let v15 = Vertex(x: 0, y: 3 * rowHeight)
        let v16 = Vertex(x: 2 * hexRadius, y: 3 * rowHeight)
        let v17 = Vertex(x: 2.5 * hexRadius, y: 3 * rowHeight)
        let v20 = Vertex(x: 0.5 * hexRadius, y: 4 * rowHeight)
        let v21 = Vertex(x: 1.5 * hexRadius, y: 4 * rowHeight)
        let v22 = Vertex(x: 3.5 * hexRadius, y: 4 * rowHeight)
        let v26 = Vertex(x: 2.0 * hexRadius, y: 5 * rowHeight)
        
        let v27 = Vertex(x: 3.0 * hexRadius, y: 5 * rowHeight)
        let e1 = Edge(v5, v1)
        let e2 = Edge(v1, v2)
        let e3 = Edge(v2, v6)
        let e4 = Edge(v6, v7)
        
        let e9 = Edge(v5, v10)
        let e10 = Edge(v10, v11)
        let e11 = Edge(v11, v6)
        let e12 = Edge(v7, v12)
        
        let e16 = Edge(v15, v10)
        let e17 = Edge(v11, v16)
        let e18 = Edge(v16, v17)
        let e19 = Edge(v17, v12)
        
        let e23 = Edge(v15, v20)
        let e24 = Edge(v20, v21)
        let e25 = Edge(v21, v16)
        let e26 = Edge(v17, v22)
        
        let e31 = Edge(v21, v26)
        let e32 = Edge(v26, v27)
        let e33 = Edge(v27, v22)
        
        XCTAssertEqual(SUT.edges.count, 19)
        XCTAssert(SUT.edges.contains(e1))
        XCTAssert(SUT.edges.contains(e2))
        XCTAssert(SUT.edges.contains(e3))
        XCTAssert(SUT.edges.contains(e4))
        XCTAssert(SUT.edges.contains(e9))
        XCTAssert(SUT.edges.contains(e10))
        XCTAssert(SUT.edges.contains(e11))
        XCTAssert(SUT.edges.contains(e12))
        XCTAssert(SUT.edges.contains(e16))
        XCTAssert(SUT.edges.contains(e17))
        XCTAssert(SUT.edges.contains(e18))
        XCTAssert(SUT.edges.contains(e19))
        XCTAssert(SUT.edges.contains(e23))
        XCTAssert(SUT.edges.contains(e24))
        XCTAssert(SUT.edges.contains(e25))
        XCTAssert(SUT.edges.contains(e26))
        XCTAssert(SUT.edges.contains(e31))
        XCTAssert(SUT.edges.contains(e32))
        XCTAssert(SUT.edges.contains(e33))
    }
}

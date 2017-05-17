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
        let topLeftEdge: Set = Set<Vertex>([leftVertex, topLeftVertex])
        XCTAssert(SUT.edges.contains(topLeftEdge))
        
        let topRightVertex = Vertex(x: 1.5*hexRadius, y: 0)
        let topEdge: Set = Set<Vertex>([topLeftVertex, topRightVertex])
        XCTAssert(SUT.edges.contains(topEdge))
        
        let rightVertex = Vertex(x: 2*hexRadius, y: rowHeight)
        let topRightEdge: Set = Set<Vertex>([topRightVertex, rightVertex])
        XCTAssert(SUT.edges.contains(topRightEdge))
        
        let bottomLeftVertex = Vertex(x: 0.5*hexRadius, y: 2*rowHeight)
        let bottomLeftEdge: Set = Set<Vertex>([leftVertex, bottomLeftVertex])
        XCTAssert(SUT.edges.contains(bottomLeftEdge))
        
        let bottomRightVertex = Vertex(x: 1.5*hexRadius, y: 2*rowHeight)
        let bottomEdge = Set<Vertex>([bottomLeftVertex, bottomRightVertex])
        XCTAssert(SUT.edges.contains(bottomEdge))
        
        let bottomRightEdge = Set<Vertex>([bottomRightVertex, rightVertex])
        XCTAssert(SUT.edges.contains(bottomRightEdge))
    }
}

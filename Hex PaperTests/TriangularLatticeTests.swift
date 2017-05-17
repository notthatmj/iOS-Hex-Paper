//
//  TriangularLatticeTests.swift
//  Hex Paper
//
//  Created by Michael Johnson on 5/17/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Hex_Paper

class TriangularLatticeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testTriangularLatticeWithRadius10() {
        let SUT = TriangularLattice(edgeLength:10)
        
        let firstVertexInFirstRow = SUT.vertexAt(row: 0, column: 0)
        XCTAssertEqual(firstVertexInFirstRow.x, 5)
        XCTAssertEqual(firstVertexInFirstRow.y, 0)
        
        let secondVertexInFirstRow = SUT.vertexAt(row: 0, column: 1)
        XCTAssertEqual(secondVertexInFirstRow.x, 15)
    }

    func testTriangularLatticeWithRadius4() {
        let SUT = TriangularLattice(edgeLength:4)
        
        let firstVertexInFirstRow = SUT.vertexAt(row: 0, column: 0)
        XCTAssertEqual(firstVertexInFirstRow.x, 2)
        XCTAssertEqual(firstVertexInFirstRow.y, 0)
        
        let secondVertexInFirstRow = SUT.vertexAt(row: 0, column: 1)
        XCTAssertEqual(secondVertexInFirstRow.x, 6)
        XCTAssertEqual(secondVertexInFirstRow.y, 0)
        
        let firstVertexInSecondRow = SUT.vertexAt(row: 1, column: 0)
        XCTAssertEqual(firstVertexInSecondRow.x, 0)
        XCTAssertEqual(firstVertexInSecondRow.y, sin(Double.pi / 3) * 4)
        
        let secondVertexInSecondRow = SUT.vertexAt(row: 1, column: 1)
        XCTAssertEqual(secondVertexInSecondRow.x, 4)
        XCTAssertEqual(secondVertexInSecondRow.y, sin(Double.pi / 3) * 4)
        
        let firstVertexInThirdRow = SUT.vertexAt(row: 2, column: 0)
        XCTAssertEqual(firstVertexInThirdRow.x, 2)
        XCTAssertEqual(firstVertexInThirdRow.y, 2 * sin(Double.pi / 3) * 4)

        let firstVertexInFourthRow = SUT.vertexAt(row: 3, column:0 )
        XCTAssertEqual(firstVertexInFourthRow.x, 0)
        XCTAssertEqual(firstVertexInFourthRow.y, 3 * sin(Double.pi / 3) * 4)
    }

}

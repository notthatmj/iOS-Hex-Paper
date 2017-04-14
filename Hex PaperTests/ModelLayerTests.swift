//
//  ModelLayerTests.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/12/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Hex_Paper

class ModelLayerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testDocumentCount() {
        let SUT = ModelLayer()
        
        XCTAssertEqual(SUT.documentCount,0)
        SUT.createDocument()
        XCTAssertEqual(SUT.documentCount,1)
        SUT.createDocument()
        XCTAssertEqual(SUT.documentCount,2)
    }
    
}

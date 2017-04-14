//
//  DocumentsViewControllerTests.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Hex_Paper

class DocumentsViewControllerTests: XCTestCase {
    
    var SUT: DocumentsViewController!
    
    override func setUp() {
        super.setUp()
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        SUT = mainStoryboard.instantiateViewController(withIdentifier: "Documents") as? DocumentsViewController
    }
    
    func testInstantiation() {
        XCTAssertNotNil(SUT)
    }
    
    func testAddButtonOutlet() {
        XCTAssertNotNil(SUT)
        XCTAssertNotNil(SUT?.addButton)
    }
    
}

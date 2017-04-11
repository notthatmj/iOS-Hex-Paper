//
//  Hex_PaperTests.swift
//  Hex PaperTests
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Hex_Paper

class Hex_PaperTests: XCTestCase {
    
    func testInitialViewController() {
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let SUT = mainStoryboard.instantiateInitialViewController()
        
        XCTAssertNotNil(SUT as? UINavigationController)
    }

}

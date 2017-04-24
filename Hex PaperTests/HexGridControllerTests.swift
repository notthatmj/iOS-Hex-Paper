//
//  HexGridControllerTests.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/24/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Hex_Paper

class FakeHexGridScene: HexGridScene {
    var minimumZoomScale: Float = 0
    var maximumZoomScale: Float = 0
}

class HexGridControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testHexGridController() {
        let SUT = HexGridController()
        XCTAssertNotNil(SUT)
    }
    
    func testStaticConstants() {
        XCTAssertEqual(HexGridController.minimumZoomScale, 0.5)
        XCTAssertEqual(HexGridController.maximumZoomScale, 40)
    }
    func testHexGridSceneViewDidLoad() {
        let SUT = HexGridController()
        let fakeHexGridScene = FakeHexGridScene()
        
        SUT.hexGridSceneViewDidLoad(fakeHexGridScene)
        
        XCTAssertEqual(fakeHexGridScene.minimumZoomScale, HexGridController.minimumZoomScale)
        XCTAssertEqual(fakeHexGridScene.maximumZoomScale, HexGridController.maximumZoomScale)
    }
    
}

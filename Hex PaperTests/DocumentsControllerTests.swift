//
//  DocumentsControllerTests.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Hex_Paper

class FakeModel: ModelLayerProtocol {
    var createDocumentWasCalled = false
    func createDocument() {
        createDocumentWasCalled = true
    }
    var documentCount: Int = 0
}

class FakeDocumentsScene: DocumentsScene {
    var segueToDocumentSceneWasCalled = false
    func segueToDocumentScene() {
        segueToDocumentSceneWasCalled = true
    }
    var refreshDocumentDataWasCalled = false
    func refreshDocumentData() {
        refreshDocumentDataWasCalled = true
    }
}

class DocumentsControllerTests: XCTestCase {
    var fakeModel: FakeModel!
    var fakeScene: FakeDocumentsScene!
    var SUT: DocumentsController!
    
    override func setUp() {
        super.setUp()
        fakeModel = FakeModel()
        fakeScene = FakeDocumentsScene()
        SUT = DocumentsController(model: fakeModel)
//        SUT.scene = fakeScene
    }
    
    func testModel() {
        let fakeModel = FakeModel()
        let SUT = DocumentsController(model: fakeModel)
        
        XCTAssert(SUT.model as? FakeModel === fakeModel)
    }
    
    func testDocumentsSceneAddButtonWasTapped() {
        SUT.documentsSceneAddButtonWasTapped(fakeScene)
        
        XCTAssert(fakeModel.createDocumentWasCalled)
        XCTAssert(fakeScene.refreshDocumentDataWasCalled)
        XCTAssert(fakeScene.segueToDocumentSceneWasCalled)
    }
    
    func testDocumentCount() {
        XCTAssertEqual(SUT.documentsCount,0)
        fakeModel.documentCount = 1
        XCTAssertEqual(SUT.documentsCount,1)
    }
}

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

class FakeDocumentsViewController: DocumentsViewControllerProtocol {
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
    var fakeViewController: FakeDocumentsViewController!
    var SUT: DocumentsController!
    
    override func setUp() {
        super.setUp()
        fakeModel = FakeModel()
        fakeViewController = FakeDocumentsViewController()
        SUT = DocumentsController(model: fakeModel)
        SUT.viewController = fakeViewController
    }
    
    func testModel() {
        let fakeModel = FakeModel()
        let SUT = DocumentsController(model: fakeModel)
        
        XCTAssert(SUT.model as? FakeModel === fakeModel)
    }
    
    func testDocumentsViewControllerAddButtonWasTapped() {
        SUT.documentsViewControllerAddButtonWasTapped()
        
        XCTAssert(fakeModel.createDocumentWasCalled)
        XCTAssert(fakeViewController.refreshDocumentDataWasCalled)
        XCTAssert(fakeViewController.segueToDocumentSceneWasCalled)
    }
    
    func testDocumentCount() {
        XCTAssertEqual(SUT.documentsCount,0)
        fakeModel.documentCount = 1
        XCTAssertEqual(SUT.documentsCount,1)
    }
}

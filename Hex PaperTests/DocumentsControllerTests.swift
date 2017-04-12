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
}

class FakeDocumentsViewController: DocumentsViewControllerProtocol {
    
}

class DocumentsControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testDocumentsController() {
        let SUT = DocumentsController()
        
        XCTAssertNotNil(SUT)
    }
    
    func testModel() {
        let fakeModel = FakeModel()
        let SUT = DocumentsController(model: fakeModel)
        
        XCTAssert(SUT.model as? FakeModel === fakeModel)
    }
    
    func testDocumentsViewControllerAddButtonWasTapped() {
        let fakeModel = FakeModel()
        let fakeViewController = FakeDocumentsViewController()
        let SUT = DocumentsController(model: fakeModel)

        SUT.documentsViewControllerAddButtonWasTapped(fakeViewController)
        
        XCTAssert(fakeModel.createDocumentWasCalled)
        
    }
}

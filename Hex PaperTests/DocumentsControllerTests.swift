//
//  DocumentsControllerTests.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Hex_Paper

class FakeModel: ModelLayer {
    var createDocumentWasCalled = false
    func createDocument() {
        createDocumentWasCalled = true
    }
    var deletedItems: [IndexPath]?
    func deleteItems(at indexPaths: [IndexPath]) {
        deletedItems = indexPaths
    }
    var documentCount: Int = 0
}

class FakeDocumentsScene: DocumentsScene {
    var delegate: DocumentsSceneDelegate?
    var segueToEditDocumentSceneWasCalled = false
    func segueToEditDocumentScene() {
        segueToEditDocumentSceneWasCalled = true
    }
    var refreshDocumentDataWasCalled = false
    func refreshDocumentData() {
        refreshDocumentDataWasCalled = true
    }
    var indexPathsForSelectedItems: [IndexPath]? = nil
    var deletedItems: [IndexPath]?
    func deleteItems(at indexPaths: [IndexPath]) {
        deletedItems = indexPaths
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
    }
    
    func testDocumentsSceneAddButtonWasTapped() {
        SUT.documentsSceneAddButtonWasTapped(fakeScene)
        
        XCTAssert(fakeModel.createDocumentWasCalled)
        XCTAssert(fakeScene.refreshDocumentDataWasCalled)
        XCTAssert(fakeScene.segueToEditDocumentSceneWasCalled)
    }
    
    func testDocumentsSceneTrashButtonWasTapped() {
        // Setup
        let testPaths = [IndexPath(row: 1, section: 0), IndexPath(row: 2, section: 0)]
        fakeScene.indexPathsForSelectedItems = testPaths
        
        // Run
        SUT.documentsSceneTrashButtonWasTapped(fakeScene)
        
        // Verify
        XCTAssertNotNil(fakeModel.deletedItems)
        if let deletedItems = fakeModel.deletedItems {
            XCTAssertEqual(deletedItems, testPaths)
        }
        XCTAssertNotNil(fakeScene.deletedItems)
        if let deletedItems = fakeScene.deletedItems {
            XCTAssertEqual(deletedItems, testPaths)
        }
    }
    
    func testDocumentCount() {
        XCTAssertEqual(SUT.documentsCount,0)
        fakeModel.documentCount = 1
        XCTAssertEqual(SUT.documentsCount,1)
    }
}

//
//  DocumentsController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

class DocumentsController {
    
    private(set) var model: ModelLayer
    
    init(model: ModelLayer) {
        self.model = model
    }
    
    convenience init() {
        self.init(model: SimpleModelLayer())
    }
    
}

extension DocumentsController: DocumentsSceneDelegate {

    var documentsCount: Int {
        return model.documentCount
    }
    
    func documentsSceneAddButtonWasTapped(_ scene: DocumentsScene) {
        model.createDocument()
        scene.refreshDocumentData()
        scene.segueToEditDocumentScene()
    }
    
    func documentsSceneTrashButtonWasTapped(_ scene: DocumentsScene) {
        if let selectedIndexPaths = scene.indexPathsForSelectedItems {
            model.deleteItems(at: selectedIndexPaths)
            scene.deleteItems(at: selectedIndexPaths)
        }
    }
    
}

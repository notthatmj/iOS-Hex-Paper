//
//  DocumentsController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

class DocumentsController: DocumentsSceneDelegate {
    
    var documentsCount: Int {
        return model.documentCount
    }
    
    var model: ModelLayer
    
    init(model: ModelLayer) {
        self.model = model
    }
    
    convenience init() {
        self.init(model: SimpleModelLayer())
    }
    
    func documentsSceneAddButtonWasTapped(_ scene: DocumentsScene) {
        model.createDocument()
        scene.refreshDocumentData()
        scene.segueToDocumentScene()
    }
    
}

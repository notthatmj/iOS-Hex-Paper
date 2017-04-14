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
    
//    weak var scene: DocumentsScene?
    
    var model: ModelLayerProtocol
    
    init(model: ModelLayerProtocol) {
        self.model = model
    }
    
    convenience init() {
        self.init(model: ModelLayer())
    }
    
    func documentsSceneAddButtonWasTapped(_ scene: DocumentsScene) {
        model.createDocument()
        scene.refreshDocumentData()
        scene.segueToDocumentScene()
    }
    
}

//
//  DocumentsController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

class DocumentsController: DocumentsViewControllerDelegate {
    
    var documentsCount: Int {
        return model.documentCount
    }
    
    var model: ModelLayerProtocol
    
    init(model: ModelLayerProtocol) {
        self.model = model
    }
    
    convenience init() {
        self.init(model: ModelLayer())
    }
    
    func documentsViewControllerAddButtonWasTapped(_ viewController: DocumentsViewControllerProtocol) {
        model.createDocument()
        viewController.segueToDocumentScene()
    }
}

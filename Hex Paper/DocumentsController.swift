//
//  DocumentsController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

protocol ModelLayerProtocol {
    func createDocument()
}

class ModelLayer: ModelLayerProtocol {
    func createDocument() {
        
    }
}

class DocumentsController: DocumentsViewControllerDelegate {
    var model: ModelLayerProtocol
    
    init(model: ModelLayerProtocol) {
        self.model = model
    }
    
    convenience init() {
        self.init(model: ModelLayer())
    }
    
    func documentsViewControllerAddButtonWasTapped(_ viewController: DocumentsViewControllerProtocol) {
        model.createDocument()
    }
    
}

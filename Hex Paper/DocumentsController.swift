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
    
    weak var viewController: DocumentsViewControllerProtocol?
    
    var model: ModelLayerProtocol
    
    init(model: ModelLayerProtocol) {
        self.model = model
    }
    
    convenience init() {
        self.init(model: ModelLayer())
    }
    
    func documentsViewControllerAddButtonWasTapped() {
        model.createDocument()
        viewController?.refreshDocumentData()
        viewController?.segueToDocumentScene()
    }
    
}

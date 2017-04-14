//
//  ModelLayer.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/12/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

protocol ModelLayerProtocol {
    var documentCount: Int {get}
    func createDocument()
}

class ModelLayer: ModelLayerProtocol {
    var documentCount: Int = 0
    
    func createDocument() {
        documentCount += 1
    }
}

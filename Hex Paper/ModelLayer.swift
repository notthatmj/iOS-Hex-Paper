//
//  ModelLayer.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/12/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

protocol ModelLayer {
    var documentCount: Int {get}
    func createDocument()
    func deleteItems(at indexPaths:[IndexPath])
}

class SimpleModelLayer: ModelLayer {
    var documentCount: Int = 0
    
    func createDocument() {
        documentCount += 1
    }
    
    func deleteItems(at indexPaths: [IndexPath]) {
        documentCount -= indexPaths.count
    }
}

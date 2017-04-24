//
//  HexGridController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/24/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

class HexGridController: HexGridSceneDelegate {
    static let minimumZoomScale: Float = 0.5
    static let maximumZoomScale: Float = 40
    
    
    func hexGridSceneViewDidLoad(_ hexGridScene: HexGridScene) {
        hexGridScene.minimumZoomScale = HexGridController.minimumZoomScale
        hexGridScene.maximumZoomScale = HexGridController.maximumZoomScale
    }
}

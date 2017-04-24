//
//  HexGridViewController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/18/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

protocol HexGridScene: class {
    var minimumZoomScale: CGFloat {get set}
    var maximumZoomScale: CGFloat {get set}
}

class HexGridViewController: UIViewController, HexGridScene {

    @IBOutlet weak var hexGridView: HexGridView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var delegate: HexGridController!
    var minimumZoomScale: CGFloat {
        get { return scrollView.minimumZoomScale }
        set { scrollView.minimumZoomScale = newValue }
    }
    var maximumZoomScale: CGFloat {
        get { return scrollView.maximumZoomScale}
        set { scrollView.maximumZoomScale = newValue }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = HexGridController()
        delegate.hexGridSceneViewDidLoad(self)
    }

}

extension HexGridViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return hexGridView
    }
}

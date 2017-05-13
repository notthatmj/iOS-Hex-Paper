//
//  HexGridViewController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/18/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

protocol HexGridSceneDelegate {
    func hexGridSceneViewDidLoad(_ hexGridScene: HexGridScene)
}

protocol HexGridScene: class {
    var minimumZoomScale: Float {get set}
    var maximumZoomScale: Float {get set}
}

class HexGridViewController: UIViewController, HexGridScene {

    @IBOutlet weak var hexGridView: HexGridView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var hexGridViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var hexGridViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var hexGridViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var hexGridViewTrailingConstraint: NSLayoutConstraint!
    
    var delegate: HexGridSceneDelegate!
    
    var minimumZoomScale: Float {
        get { return Float(scrollView.minimumZoomScale) }
        set { scrollView.minimumZoomScale = CGFloat(newValue) }
    }
    var maximumZoomScale: Float {
        get { return Float(scrollView.maximumZoomScale)}
        set { scrollView.maximumZoomScale = CGFloat(newValue) }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = HexGridController()
        delegate.hexGridSceneViewDidLoad(self)
        updateConstraints()
    }

    fileprivate func updateConstraints() {
        let size = scrollView.frame.size
        let yOffset = max(0, (size.height - hexGridView.frame.height) / 2)
        hexGridViewTopConstraint.constant = yOffset
        hexGridViewBottomConstraint.constant = -yOffset
        
        let xOffset = max(0, (size.width - hexGridView.frame.width) / 2)
        hexGridViewLeadingConstraint.constant = xOffset
        hexGridViewTrailingConstraint.constant = -xOffset
    }

}

extension HexGridViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return hexGridView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraints()
        view.layoutIfNeeded()
    }
}

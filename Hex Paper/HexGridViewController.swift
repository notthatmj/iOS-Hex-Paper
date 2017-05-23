//
//  HexGridViewController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/18/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

class HexGridViewController: UIViewController {

    @IBOutlet weak var hexGridView: HexGridView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var hexGridViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var hexGridViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var hexGridViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var hexGridViewTrailingConstraint: NSLayoutConstraint!
    
    static let minimumZoomScale: CGFloat = 0.25
    static let maximumZoomScale: CGFloat = 40

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = HexGridViewController.minimumZoomScale
        scrollView.maximumZoomScale = HexGridViewController.maximumZoomScale
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustZoomScaleToFit()
        updateConstraints()
    }

    func adjustZoomScaleToFit() {
        let intrinsicSize = hexGridView.intrinsicContentSize
        
        let intrinsicWidth = intrinsicSize.width
        let scrollViewWidth = scrollView.frame.size.width
        let widthZoomScale = scrollViewWidth / intrinsicWidth
        
        let intrinsicHeight = intrinsicSize.height
        let scrollViewHeight = scrollView.frame.size.height
        let heightZoomScale = scrollViewHeight / intrinsicHeight
        
        scrollView.zoomScale = min(heightZoomScale, widthZoomScale)
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

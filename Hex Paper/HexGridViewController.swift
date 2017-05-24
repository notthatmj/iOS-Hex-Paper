//
//  HexGridViewController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/18/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

class HexGridViewController: UIViewController {

    @IBOutlet var hexGridView: HexGridView!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var hexGridViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var hexGridViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var hexGridViewTopConstraint: NSLayoutConstraint!
    @IBOutlet var hexGridViewTrailingConstraint: NSLayoutConstraint!
    
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

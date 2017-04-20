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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 40
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HexGridViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return hexGridView
    }
}

//
//  DocumentsViewController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

protocol DocumentsViewControllerDelegate {
    func documentsViewControllerAddButtonWasTapped(_ viewController:DocumentsViewController)
}

class DocumentsViewController: UICollectionViewController {
    var delegate: DocumentsViewControllerDelegate = DocumentsController()

    @IBOutlet weak var addButton: UIBarButtonItem!

    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        delegate.documentsViewControllerAddButtonWasTapped(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  DocumentsViewController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

protocol DocumentsViewControllerDelegate {
    func documentsViewControllerAddButtonWasTapped(_ viewController:DocumentsViewControllerProtocol)
}

protocol DocumentsViewControllerProtocol {
        
}

class DocumentsViewController: UICollectionViewController, DocumentsViewControllerProtocol {
    var delegate: DocumentsViewControllerDelegate!
    
    @IBOutlet weak var addButton: UIBarButtonItem!

    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        delegate.documentsViewControllerAddButtonWasTapped(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = DocumentsController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


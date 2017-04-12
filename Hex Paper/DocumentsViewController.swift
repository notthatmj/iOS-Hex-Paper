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
    var documentsCount: Int { get }
    var viewController: DocumentsViewController? { get set }
}

protocol DocumentsViewControllerProtocol {
    func segueToDocumentScene()
    func refreshDocumentData()
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
        delegate.viewController = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func segueToDocumentScene() {
        self.performSegue(withIdentifier: "addDocument", sender: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate.documentsCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
    func refreshDocumentData() {
    }
}


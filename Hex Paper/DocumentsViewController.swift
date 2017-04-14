//
//  DocumentsViewController.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import UIKit

protocol DocumentsSceneDelegate {
    func documentsSceneAddButtonWasTapped(_ scene: DocumentsScene)
    var documentsCount: Int { get }
}

protocol DocumentsScene: class {
    var delegate: DocumentsSceneDelegate? {get set}
    func segueToEditDocumentScene()
    func refreshDocumentData()
}

class DocumentsViewController: UICollectionViewController {

    var delegate: DocumentsSceneDelegate?
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        delegate?.documentsSceneAddButtonWasTapped(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = DocumentsController()
    }

}

// Scene methods
extension DocumentsViewController: DocumentsScene {
    
    func segueToEditDocumentScene() {
        self.performSegue(withIdentifier: "addDocument", sender: self)
    }
    
    func refreshDocumentData() {
        self.collectionView?.reloadData()
    }
    
}

// Data source methods
extension DocumentsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.documentsCount ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
}

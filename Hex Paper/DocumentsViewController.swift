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
    func documentsSceneTrashButtonWasTapped(_ scene: DocumentsScene)
    var documentsCount: Int { get }
}

protocol DocumentsScene: class {
    var delegate: DocumentsSceneDelegate? {get set}
    var indexPathsForSelectedItems: [IndexPath]? { get }
    func deleteItems(at indexPaths: [IndexPath])
    func segueToEditDocumentScene()
    func refreshDocumentData()
}

class DocumentsViewController: UICollectionViewController {

    let borderColor = UIColor(colorLiteralRed: 0.220, green: 0.506, blue: 0.153, alpha: 1.0).cgColor
    let borderWidth: CGFloat = 1.0
    let selectedBorderWidth: CGFloat = 3.0

    private var initialRightBarButtonItems: [UIBarButtonItem]?
    private var initialLeftBarButtonItems: [UIBarButtonItem]?
    
    var delegate: DocumentsSceneDelegate?
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        delegate?.documentsSceneAddButtonWasTapped(self)
    }
    
    @IBAction func trashButtonAction(_ sender: UIBarButtonItem) {
        delegate?.documentsSceneTrashButtonWasTapped(self)
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        self.collectionView?.deselectItem(at: IndexPath.init(row: 0, section: 0), animated: true)
        for indexPath in indexPathsForSelectedItems ?? [] {
            let cell = self.collectionView?.cellForItem(at: indexPath)
            cell?.layer.borderWidth = borderWidth
        }
        enterStandardMode()
    }

    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        self.enterSelectionMode()
    }

    private func enterSelectionMode() {
        initialRightBarButtonItems = navigationItem.rightBarButtonItems
        initialLeftBarButtonItems = navigationItem.leftBarButtonItems
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(DocumentsViewController.doneButtonAction))
        navigationItem.setRightBarButtonItems([doneButton], animated: true)
        
        let trashButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(DocumentsViewController.trashButtonAction))
        navigationItem.setLeftBarButtonItems([trashButton], animated: true)
        
        self.collectionView?.allowsSelection = true
        self.collectionView?.allowsMultipleSelection = true
    }

    private func enterStandardMode() {
        self.collectionView?.allowsSelection = false
        navigationItem.setRightBarButtonItems(initialRightBarButtonItems, animated: true)
        navigationItem.setLeftBarButtonItems(initialLeftBarButtonItems, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = DocumentsController()
        self.collectionView?.allowsSelection = false
    }

}

// Scene methods
extension DocumentsViewController: DocumentsScene {
    
    var indexPathsForSelectedItems: [IndexPath]? {
        get {
            return self.collectionView?.indexPathsForSelectedItems
        }
    }
    
    func segueToEditDocumentScene() {
        self.performSegue(withIdentifier: "addDocument", sender: self)
    }
    
    func refreshDocumentData() {
        self.collectionView?.reloadData()
    }
    
    func deleteItems(at indexPaths: [IndexPath]) {
        self.collectionView?.deleteItems(at: indexPaths)
    }
    
}

// Delegate methods 
extension DocumentsViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = self.collectionView?.cellForItem(at: indexPath)
        cell?.layer.borderWidth = selectedBorderWidth
    }

    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = self.collectionView?.cellForItem(at: indexPath)
        cell?.layer.borderWidth = borderWidth
    }
}

// Data source methods
extension DocumentsViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.documentsCount ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.layer.borderWidth = borderWidth
        cell.layer.borderColor = borderColor
        return cell
    }
    
}

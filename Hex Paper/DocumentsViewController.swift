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

    var delegate: DocumentsSceneDelegate?
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        delegate?.documentsSceneAddButtonWasTapped(self)
    }
    
    @IBAction func trashButtonAction(_ sender: UIBarButtonItem) {
        trashButton.isEnabled = false
        delegate?.documentsSceneTrashButtonWasTapped(self)
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        selectionMode = false
    }

    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        selectionMode = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = DocumentsController()
        collectionView?.allowsSelection = false
        initialRightBarButtonItems = navigationItem.rightBarButtonItems
        initialLeftBarButtonItems = navigationItem.leftBarButtonItems
    }

    private var initialRightBarButtonItems: [UIBarButtonItem]?
    private var initialLeftBarButtonItems: [UIBarButtonItem]?
    fileprivate var trashButton = UIBarButtonItem(barButtonSystemItem: .trash,
                                      target: self,
                                      action: #selector(DocumentsViewController.trashButtonAction))
    fileprivate var doneButton: UIBarButtonItem?
    
    private var selectionMode: Bool = false {
        didSet {
            if selectionMode {
                let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                                 target: self,
                                                 action: #selector(DocumentsViewController.doneButtonAction))
                navigationItem.setRightBarButtonItems([doneButton], animated: true)
                self.doneButton = doneButton
                let trashButton = UIBarButtonItem(barButtonSystemItem: .trash,
                                                  target: self,
                                                  action: #selector(DocumentsViewController.trashButtonAction))
                navigationItem.setLeftBarButtonItems([trashButton], animated: true)
                trashButton.isEnabled = false
                self.trashButton = trashButton
                
                collectionView?.allowsSelection = true
                collectionView?.allowsMultipleSelection = true
            } else {
                navigationItem.setRightBarButtonItems(initialRightBarButtonItems, animated: true)
                navigationItem.setLeftBarButtonItems(initialLeftBarButtonItems, animated: true)
                for indexPath in indexPathsForSelectedItems ?? [] {
                    let cell = collectionView?.cellForItem(at: indexPath)
                    cell?.layer.borderWidth = borderWidth
                }
                collectionView?.allowsSelection = false
            }
        }
    }
    
}

// Scene methods
extension DocumentsViewController: DocumentsScene {
    
    var indexPathsForSelectedItems: [IndexPath]? {
        get {
            return collectionView?.indexPathsForSelectedItems
        }
    }
    
    func segueToEditDocumentScene() {
        performSegue(withIdentifier: "addDocument", sender: self)
    }
    
    func refreshDocumentData() {
        collectionView?.reloadData()
    }
    
    func deleteItems(at indexPaths: [IndexPath]) {
        collectionView?.deleteItems(at: indexPaths)
    }
    
}

// UICollectionViewDelegate methods
extension DocumentsViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        trashButton.isEnabled = true
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = selectedBorderWidth
        
        
    }

    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = borderWidth
        if collectionView.indexPathsForSelectedItems == nil ||
            collectionView.indexPathsForSelectedItems?.count == 0 {
            trashButton.isEnabled = false
        }
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

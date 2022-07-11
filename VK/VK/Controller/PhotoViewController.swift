//
//  PhotoViewController.swift
//  VK
//
//  Created by Lera on 22.06.22.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var selectedPhoto: Int = 0
    var photoAlbum: [UIImage] = []
    var friend: User?
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions

extension PhotoViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            
            preconditionFailure("Error")
        }
        cell.friendPhoto.image = photoAlbum[indexPath.row]
        
        return cell
    }
}

extension PhotoViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // performSegue(withIdentifier: "showScaledPhoto", sender: nil)
    }
    
    
    
}

//
//  PhotoViewController.swift
//  VK
//
//  Created by Lera on 22.06.22.
//

import UIKit

class PhotoViewController: UIViewController {
    
    let photoAlbum = [
        UIImage(systemName: "logo"),
        UIImage(systemName: "logo"),
        UIImage(systemName: "logo"),
        UIImage(systemName: "logo"),
        UIImage(systemName: "logo"),
        UIImage(systemName: "logo"),
        UIImage(systemName: "logo"),
        UIImage(systemName: "logo"),
    ]
    
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
        
        // Do any additional setup after loading the view.
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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
        print("Нажат элемент \(indexPath.row)")
    }
    
}

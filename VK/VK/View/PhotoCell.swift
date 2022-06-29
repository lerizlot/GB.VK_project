//
//  PhotoCell.swift
//  VK
//
//  Created by Lera on 20.06.22.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var friendPhoto: UIImageView!
    
    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var container: UIView!
    
    override class func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTouchesRequired = 2
        container.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_: UITapGestureRecognizer) {
        likeControl.isLiked.toggle()
        
        if likeControl.isLiked {
            likeControl.likePicture.image = (UIImage(systemName: "suit.heart.fill"))
        } else {
            likeControl.likePicture.image = nil
        }
    }
}

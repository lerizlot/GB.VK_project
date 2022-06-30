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
    
    override func awakeFromNib() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTouchesRequired = 1
        container.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_: UITapGestureRecognizer) {
        likeControl.isLiked.toggle()
        
        if likeControl.isLiked {
            likeControl.likePicture.image = (UIImage(systemName: "arrow.up.heart.fill"))
            likeControl.likeQuantity.text = "1"
            likeControl.likePicture.transform3D = scale
        } else {
            likeControl.likePicture.image = (UIImage(systemName: "arrow.down.heart"))
            likeControl.likeQuantity.text = "0"
            likeControl.likePicture.transform3D = scaleBack
        }
    }
    
  //  let flip = CGAffineTransform
    let scale = CATransform3DMakeScale(1.3, 1.3, 1.3)
    let scaleBack = CATransform3DMakeScale(1, 1, 1)
}

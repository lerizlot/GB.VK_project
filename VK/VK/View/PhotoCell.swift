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
    
    var likeControl = LikeControl()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        likeControl.frame = CGRect(x: self.frame.size.width - 40,
                                   y: self.frame.size.height - 30,
                                   width: 38,
                                   height: 28)
        self.addSubview(likeControl)
    }
    
}

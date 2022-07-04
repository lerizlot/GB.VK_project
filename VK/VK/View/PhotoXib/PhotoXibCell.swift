//
//  PhotoXibCell.swift
//  VK
//
//  Created by Lera on 30.06.22.
//

import UIKit

class PhotoXibCell: UICollectionViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet var likeControl: LikeControl!
    @IBOutlet var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

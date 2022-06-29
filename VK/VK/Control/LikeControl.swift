//
//  LikeControl.swift
//  VK
//
//  Created by Lera on 26.06.22.
//

import UIKit

@IBDesignable class LikeControl: UIControl {

    @IBOutlet var likePicture: UIImageView!
    
    var isLiked: Bool = false
    
    override func awakeFromNib() {
        likePicture.backgroundColor = .clear
        likePicture.tintColor = .red
    }
}

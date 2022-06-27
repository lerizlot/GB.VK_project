//
//  Photo.swift
//  VK
//
//  Created by Lera on 26.06.22.
//

import UIKit

struct Photo {
    
    let image: UIImage
    var isLiked: Bool {
        didSet {
            likeCount += isLiked ? 1 : -1
        }
    }
    var likeCount: Int
}

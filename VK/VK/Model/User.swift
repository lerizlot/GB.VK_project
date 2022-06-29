//
//  User.swift
//  VK
//
//  Created by Lera on 20.06.22.
//

import Foundation
import UIKit

class User {
    
    let name: String
    let image: UIImage?
    let album: [UIImage]
    
    init(name: String, image: UIImage? = nil, album: [UIImage]) {
        self.name = name
        self.image = image
        self.album = album
        
    }
    
    //сравниваем левое значение с правым значением
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.name == rhs.name
    }
    
}

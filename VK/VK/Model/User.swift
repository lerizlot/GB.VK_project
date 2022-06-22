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
    
    init(name: String, image: UIImage? = nil) {
        self.name = name
        self.image = image
        
    }
    
}

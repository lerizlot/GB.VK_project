//
//  News.swift
//  VK
//
//  Created by Lera on 04.07.22.
//

import UIKit
import Foundation

struct News {
    
    let avatar: UIImage!
    let name: String
    let date: String
    let text: String
    let image1: UIImage!
//    let image2: UIImage!
//    let image3: UIImage!
//    let image4: UIImage!
    var likes: UInt = UInt.random(in: 0..<255)
    var comments: UInt = UInt.random(in: 0..<255)
    var replies: UInt = UInt.random(in: 0..<255)
    var views: UInt = UInt.random(in: 0..<255)
}


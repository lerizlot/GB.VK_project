//
//  FullScreenPhotoController.swift
//  VK
//
//  Created by Lera on 11.07.22.
//

import UIKit

class FullScreenPhotoController: UIViewController {
    
    var photo = [UIImage]()
    var row: Int?
    var selectedPhoto: Int = 0
    
    @IBOutlet weak var scaledPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

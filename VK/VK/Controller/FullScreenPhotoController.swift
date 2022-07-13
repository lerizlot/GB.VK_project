//
//  FullScreenPhotoController.swift
//  VK
//
//  Created by Lera on 11.07.22.
//

import UIKit

class FullScreenPhotoController: UIViewController {
    
    var photo = [UIImage]()
    var selectedPhoto: Int = 0
    
    @IBOutlet weak var scaledPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scaledPhoto.image = photo[selectedPhoto]
        scaledPhoto.backgroundColor = view.backgroundColor
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftAction))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRightAction))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)

    }
    
    @objc func swipeLeftAction() {
        guard photo.count > selectedPhoto + 1 else { return }
        let nextImage = photo[selectedPhoto + 1]
        let photoView = UIImageView ()
        photoView.image = nextImage
        view.addSubview(photoView)
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.scaledPhoto.transform = CGAffineTransform (scaleX: 0.8, y: 0.8)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
               photoView.frame.origin.y = 0
            }
        } completion: { _ in
            self.scaledPhoto.image = nextImage
            self.scaledPhoto.transform = .identity
            self.selectedPhoto += 1
        }

    }
    @objc func swipeRightAction() {
        guard selectedPhoto - 1 >= 0 else { return }
        let nextImage = photo[selectedPhoto - 1]
        let photoView = UIImageView ()
        photoView.image = nextImage
        view.addSubview(photoView)
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: []) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3) {
                self.scaledPhoto.transform = CGAffineTransform (scaleX: 0.8, y: 0.8)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3) {
                photoView.frame.origin.x = 0
            }
        } completion: { _ in
            self.scaledPhoto.image = nextImage
            self.scaledPhoto.transform = .identity
            self.selectedPhoto -= 1
        }
    }
}

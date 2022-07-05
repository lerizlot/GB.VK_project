//
//  FriendCell.swift
//  VK
//
//  Created by Lera on 20.06.22.
//

import UIKit

class FriendCell: UITableViewCell {
    
    //    static let reuseIdentifier = "FriendXibCell"
    
    // MARK: - Outlets
    
    @IBOutlet weak var friendImage: UIImageView! {
        didSet {
            // включаем поддержку тапа
            friendImage.isUserInteractionEnabled = true
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(animateImage))
            friendImage.addGestureRecognizer(tapRecognizer)
        }
    }
    @IBOutlet weak var friendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupView() {
        friendImage.layer.cornerRadius = friendImage.bounds.height / 2
        friendImage.layer.borderWidth = 1
        friendImage.layer.borderColor = UIColor.blue.cgColor
    }
    
    @objc func animateImage(_ sender: UITapGestureRecognizer) {
        imageAnimation()
    }
    
    func imageAnimation() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0.5
        animation.toValue = 1
        animation.stiffness = 200 // жесткость
        animation.mass = 1 // масса слоя
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        self.friendImage.layer.add(animation, forKey: nil)
    }
    
}

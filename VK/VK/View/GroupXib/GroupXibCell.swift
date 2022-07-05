//
//  GroupXibCell.swift
//  VK
//
//  Created by Lera on 30.06.22.
//

import UIKit

class GroupXibCell: UITableViewCell {
    
    static let reuseIdentifier = "GroupXibCell"
    
    // MARK: - Outlets

    @IBOutlet weak var groupImage: UIImageView! {
        didSet {
            // включаем поддержку тапа
            groupImage.isUserInteractionEnabled = true
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(animateImage))
            groupImage.addGestureRecognizer(tapRecognizer)
            print("произошел тап по картинке")
        }
    }
    
    @IBOutlet weak var groupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    func setupView() {
        groupImage.layer.cornerRadius = groupImage.bounds.height / 2
        groupImage.layer.borderWidth = 1
        groupImage.layer.borderColor = UIColor.black.cgColor
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
        
        self.groupImage.layer.add(animation, forKey: nil)
    }
    
}

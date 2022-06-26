//
//  ShadowView.swift
//  VK
//
//  Created by Lera on 24.06.22.
//

import Foundation
import UIKit


class ShadowView: UIView {
    
    var shadowRadius: CGFloat = 25 {
        didSet {
            setNeedsDisplay() // метод для перерисовки view
        }
    }
    var shadowOpacity: Float = 0.7
    var color = UIColor.black.cgColor
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupShadowView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.size.width / 2
    }
    
    func setupShadowView() {
        layer.shadowColor = color
        layer.shadowOffset = .zero
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
    }
}

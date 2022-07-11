//
//  ShadowView.swift
//  VK
//
//  Created by Lera on 24.06.22.
//

import Foundation
import UIKit


@IBDesignable class ShadowView: UIView {
    
    var shadowRadius: CGFloat = 25 {
        didSet {
            setNeedsDisplay() // метод для перерисовки view
        }
    }
    var shadowOpacity: Float = 0.7
    var color = UIColor.black.cgColor
    
    // подготавливает получатель после его загрузки из Interface Builder или файла xib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupShadowView()
    }
    // тут происходит вычисление размера и расположения ui-компонентов
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // задаем круглую форму shadowView
        layer.cornerRadius = bounds.height / 2
    }
    
    func setupShadowView() {
        layer.shadowColor = color
        layer.shadowOffset = .zero
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
    }
}

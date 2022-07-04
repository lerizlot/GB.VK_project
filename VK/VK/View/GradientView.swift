//
//  GradientView.swift
//  VK
//
//  Created by Lera on 04.07.22.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    // создаем вычисляемую переменную для работы со слоем
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    // начальный цвет градиента
    @IBInspectable var startColor: UIColor = .red {
        didSet {
            self.updateColors()
        }
    }
    // конечный цвет градиента
    @IBInspectable var endColor: UIColor = .blue {
        didSet {
            self.updateColors()
        }
    }
    @IBInspectable var startLocation: CGFloat = 0 {
        didSet {
            self.updateLocations()
        }
    }
    @IBInspectable var endLocation: CGFloat = 1 {
        didSet {
            self.updateLocations()
        }
    }
    
    // точка начала градиента
    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            self.updateStartPoint()
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet {
            self.updateEndPoint()
        }
    }
    
    // меняем класс слоя на CAGradientLayer
    override static var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    // MARK: - методы которые будут обновлять параметры слоя с градиентом
    func updateLocations() {
        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
    }
    
    func updateColors() {
        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
    }
    
    func updateStartPoint() {
        self.gradientLayer.startPoint = startPoint
    }
    
    func updateEndPoint() {
        self.gradientLayer.endPoint = endPoint
    }
    
    
    
    

}

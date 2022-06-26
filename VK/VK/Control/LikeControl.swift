//
//  LikeControl.swift
//  VK
//
//  Created by Lera on 26.06.22.
//

import UIKit

@IBDesignable class LikeControl: UIControl {
    
    var button = UIButton(type: .custom)
    var quantity = UILabel(frame: CGRect(x: 28, y: 0, width: 10, height: 28))
    
    var tapGestureRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer(target: LikeControl.self,
                                                action: #selector(onTap))
        return recognizer
    } ()
    
    @objc func onTap() {
        print("произошло нажатие")
    }
    
    @objc private func animateLabel(_ sender: UIButton) {
        
        self.quantity.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        self.quantity.text = "1"
        self.button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    // MARK: - Инициализаторы класса
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // настройка расположения и внешнего вида контрола
    func setupView() {
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.tintColor = .red
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        button.addTarget(self, action: #selector(animateLabel), for: .touchUpInside)

        quantity.textColor = .red
        quantity.text = "0"
        quantity.font = .systemFont(ofSize: 15)
        
        self.addSubview(button)
        self.addSubview(quantity)
    }
    
    
}

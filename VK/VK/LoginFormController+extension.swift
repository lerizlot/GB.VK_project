//
//  LoginFormController+extension.swift
//  VK
//
//  Created by Lera on 16.06.22.
//

import Foundation
import UIKit

extension LoginFormController {
    
    func show(message: String) {
        
        let alertVC = UIAlertController(title: "Error",
                                        message: message,
                                        preferredStyle: .alert)
        // создаем действие
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { _ in
            self.loginTextField.text = ""
            self.passwordTextField.text = ""
        }
        
        // добавляем действие на экран
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true)
        
    }
}

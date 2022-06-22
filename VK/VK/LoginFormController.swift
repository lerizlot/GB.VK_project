//
//  LoginFormController.swift
//  VK
//
//  Created by Lera on 16.06.22.
//

import UIKit

class LoginFormController: UIViewController {
    
    
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    @IBAction func tapButtonLogin(_ sender: Any) {
        
      
            
            performSegue(withIdentifier: "Login", sender: nil)
        }
    }

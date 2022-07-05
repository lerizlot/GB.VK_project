//
//  LoginFormController.swift
//  VK
//
//  Created by Lera on 16.06.22.
//

import UIKit

class LoginFormController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadingAnimation()
        
        let dot1 = UIView.init(frame: (CGRect(x: (self.view.bounds.width / 2 - 35), y: (self.view.bounds.height / 2 + 120), width: 15, height: 15)))
        dot1.layer.cornerRadius = dot1.bounds.height / 2
        dot1.layer.borderColor = UIColor.white.cgColor
        dot1.backgroundColor = UIColor.white
        dot1.layer.masksToBounds = true
        dot1.layer.borderWidth = 2
        
        let dot2 = UIView.init(frame: (CGRect(x: (self.view.bounds.width / 2 - 10), y: (self.view.bounds.height / 2 + 120), width: 15, height: 15)))
        dot2.layer.cornerRadius = dot2.bounds.height / 2
        dot2.layer.borderColor = UIColor.white.cgColor
        dot2.backgroundColor = UIColor.white
        dot2.layer.masksToBounds = true
        dot2.layer.borderWidth = 2
        
        let dot3 = UIView.init(frame: (CGRect(x: (self.view.bounds.width / 2 + 15), y: (self.view.bounds.height / 2 + 120), width: 15, height: 15)))
        dot3.layer.cornerRadius = dot3.bounds.height / 2
        dot3.layer.borderColor = UIColor.white.cgColor
        dot3.backgroundColor = UIColor.white
        dot3.layer.masksToBounds = true
        dot3.layer.borderWidth = 2
        
        self.view.addSubview(dot1)
        self.view.addSubview(dot2)
        self.view.addSubview(dot3)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.autoreverse, .repeat],
                       animations: { dot1.backgroundColor = UIColor.gray },
                       completion: nil)
        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       options: [.autoreverse, .repeat],
                       animations: { dot2.backgroundColor = UIColor.gray },
                       completion: nil)
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: [.autoreverse, .repeat],
                       animations: { dot3.backgroundColor = UIColor.gray },
                       completion: nil)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        // Добавляем жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollView
        loginScrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления addObserver:
        // Одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        // Второе - когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3,
                       delay: 0.5,
                          options: [.curveEaseInOut, .autoreverse, .repeat]) {
            self.logoImage.layer.position.y += 100
            self.logoImage.alpha = 0
//        } completion: { _ in
//            self.logoImage.layer.position.x -= 150
//            self.logoImage.alpha = 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Метод отписки от уведомлений при исчезновении контроллера с экрана
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    // MARK: - Segue
    
    // Переход на следующий экран будет выполнен при правильно введенных данных
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Проверяем данные
        let checkResult = checkUserData()
        
        // Если данные не верны, покажем ошибку
        if !checkResult {
            showLoginError()
        }
        
        // Вернем результат
        return checkResult
    }
    
    // MARK: - Login
    
    // Проверка введенных данных
    func checkUserData() -> Bool {
        guard let login = loginTextField.text,
              let password = passwordTextField.text else { return false }
        if login == "" && password == "" {
            return true
        } else {
            return false
        }
    }
    
    // При ошибке появится всплывающее окно сообщающее об этом
    func showLoginError() {
        // Создаем контроллер
        let alert = UIAlertController(title: "Error", message: "Wrong login or password", preferredStyle: .alert)
        // Создаем кнопку UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку UIAlertController
        alert.addAction(action)
        // Показываем UIAlertController
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapButtonLogin(_ sender: Any) {
        //        // Получаем текст логина
        //        let login = loginTextField.text!
        //        // Получаем текст-пароль
        //        let password = passwordTextField.text!
        //
        //        // Проверяем, верны ли они
        //        if login == "" && password == "" {
        //            print("Authorization successfull, Welcome!")
        //        } else {
        //            print("Wrong email or password")
        //        }
        //
        // performSegue(withIdentifier: "", sender: nil)
    }
    
    // MARK: - Keyboard
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.loginScrollView?.contentInset = contentInsets
        loginScrollView?.scrollIndicatorInsets = contentInsets
    }
    // Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        loginScrollView?.contentInset = contentInsets
    }
    
    // Добавляем метод для исчезновения клавиатуры при клике по пустому месту на экране
    @objc func hideKeyboard() {
        self.loginScrollView?.endEditing(true)
    }
    
    // MARK: - UnwindSegue
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){}
}

// MARK: - Three dots loading animation

//func loadingAnimation() {
//
//    let dot1 = UIView.init(frame: CGRect(x: (self.view.bounds.width / 2 - 35), y: (self.view.bounds.height / 2 + 75), width: 15, height: 15))
//    dot1.layer.cornerRadius = dot1.bounds.height / 2
//    dot1.layer.borderColor = UIColor.white.cgColor
//    dot1.backgroundColor = .white
//    dot1.layer.masksToBounds = true
//    dot1.layer.borderWidth = 2
//}

private func loadingAnimation() {
    
 
}

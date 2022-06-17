//
//  LoginFormController.swift
//  VK
//
//  Created by Lera on 16.06.22.
//

import UIKit

class LoginFormController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Метод отписки от уведомлений при исчезновении контроллера с экрана
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
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
    
    // MARK: Keyboard
    
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
    
    // MARK: UnwindSegue
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){}
}

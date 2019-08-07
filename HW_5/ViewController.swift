//
//  ViewController.swift
//  HW_5
//
//  Created by Роман Важник on 06/08/2019.
//  Copyright © 2019 Роман Важник. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var buttonsCollection: [UIButton]!
    
    private let login = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil, queue: nil) { (text) in
            self.view.frame.origin.y = -150
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil, queue: nil) { (text) in
            self.view.frame.origin.y = 0
        }
        
        setupForButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func loginButtonPressed() {
        
        if loginTextField.text == login && passwordTextField.text == password {
            performSegue(withIdentifier: "nextController", sender: nil)
        } else {
            createAlertController(
                "invalid login or password",
                "please, enter correct login and password"
            )
            loginTextField.text = ""
            passwordTextField.text = ""
        }
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        if sender.tag == 0 {
            createAlertController("Oops!", "Your name is User")
        } else {
            createAlertController("Oops!", "Your password is Password")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondView = segue.destination as! SecondViewController
        secondView.texForUserName = login
    }
    
    //MARK: - create alertController
    private func createAlertController(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func setupForButtons() {
        for button in buttonsCollection {
            button.layer.cornerRadius = 5
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
           passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}

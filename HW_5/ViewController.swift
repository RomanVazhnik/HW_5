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
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if loginTextField.text == login && passwordTextField.text == password {
            performSegue(withIdentifier: "kek", sender: nil)
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
    
    //MARK: - create alertController
    private func createAlertController(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}


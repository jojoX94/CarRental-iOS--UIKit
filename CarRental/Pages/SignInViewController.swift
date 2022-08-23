//
//  ViewController.swift
//  CarRental
//
//  Created by Madiapps on 27/07/2022.
//

import UIKit
import FirebaseAuth

class SignInViewController: VC {

    @IBOutlet weak var emailTextField: IconTextField!
    @IBOutlet weak var pwdTextField: IconTextField!
    
    @IBOutlet var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func SignIn(_ sender: Any) {
        if let email = emailTextField.text, let password = pwdTextField.text, email != "", password != "" {
            isLoading = true
            Auth.auth().signIn(withEmail: email, password: password) {
                [weak self] (authResult, error) in
                if let error = error{
                    self?.isLoading = false
                    if let errCode = AuthErrorCode.Code(rawValue: error._code) {
                         self?.alertUser(of: errCode)
                    }
                    return
                    
                }
                UserDefaults.standard.set("test", forKey: "username")
                self?.isLoading = false
                self?.changeRootVC(to: "TabBarViewController")
            }
        }
    }
    
    @IBAction func goToSignUpScreen(_ sender: Any) {
        self.changeRootVC(to: "SignUpViewController")
    }
}


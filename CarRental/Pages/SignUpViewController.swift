//
//  SignUpViewController.swift
//  CarRental
//
//  Created by Madiapps on 22/08/2022.
//

import UIKit
import FirebaseAuth

class SignUpViewController: VC {
    
    
    @IBOutlet weak var emailTextField: IconTextField!
    @IBOutlet weak var pwdTextField: IconTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func SignUp(_ sender: Any) {
        
        if let email = emailTextField.text, let password = pwdTextField.text, email != "", password != "" {
            isLoading = true
            Auth.auth().createUser(withEmail: email, password: password) {
                [weak self] (authResult, error) in
                if let error = error{
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
    
    
    @IBAction func goToSignInScreen(_ sender: Any) {
        changeRootVC(to: "SignInViewController")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

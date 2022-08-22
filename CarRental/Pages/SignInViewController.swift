//
//  ViewController.swift
//  CarRental
//
//  Created by Madiapps on 27/07/2022.
//

import UIKit

class SignInViewController: VC {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func SignIn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "TabBarViewController")
        UserDefaults.standard.set("test", forKey: "username")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
    @IBAction func goToSignUpScreen(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signUpViewController = storyboard.instantiateViewController(identifier: "SignUpViewController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(signUpViewController)
    }
}


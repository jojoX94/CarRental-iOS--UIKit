//
//  ViewController.swift
//  CarRental
//
//  Created by Madiapps on 27/07/2022.
//

import UIKit

class AuthViewController: VC {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func SignUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "TabBar")
        UserDefaults.standard.set("test", forKey: "username")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
    }
    
}


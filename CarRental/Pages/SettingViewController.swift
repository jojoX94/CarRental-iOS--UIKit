//
//  SettingViewController.swift
//  CarRental
//
//  Created by Madiapps on 19/08/2022.
//

import UIKit

class SettingViewController: VC {

    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.makeRounded()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func goToSignInScreen(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signUpViewController = storyboard.instantiateViewController(identifier: "SignUpViewController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(signUpViewController)
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
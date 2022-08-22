//
//  SettingViewController.swift
//  CarRental
//
//  Created by Madiapps on 19/08/2022.
//

import UIKit
import FirebaseAuth

class SettingViewController: VC {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var authButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    fileprivate func initView() {
        profileImageView.makeRounded()
        Auth.auth().addStateDidChangeListener {
            [weak self] auth , user in
            if let user = user {
                self?.authButton.backgroundColor = .systemGreen
                self?.authButton.setTitle("Sign Out", for: .normal)
            } else {
                self?.authButton.backgroundColor = UIColor(named: "regularPink")
                self?.authButton.setTitle("Sign Up", for: .normal) 
            }
        }
    }

    @IBAction func goToSignInScreen(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let signUpViewController = storyboard.instantiateViewController(identifier: "SignUpViewController")
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(signUpViewController)
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
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

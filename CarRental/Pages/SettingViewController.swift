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
            if user != nil {
                self?.authButton.setBackgroundColor(color: .systemGreen, forState: .normal)
                self?.authButton.setTitle("Sign Out", for: .normal)
            } else {
                self?.authButton.setBackgroundColor(color: UIColor(named: "regularPink") ?? .systemPink, forState: .normal)
                self?.authButton.setTitle("Sign Up", for: .normal)
            }
        }
    }

    @IBAction func goToSignInScreen(_ sender: Any) {
        if Auth.auth().currentUser == nil {
            self.changeRootVC(to: "SignUpViewController")
        } else {
            let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
            } catch let signOutError as NSError {
              print("Error signing out: %@", signOutError)
            }
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

//
//  LaunchViewController.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit


class LaunchViewController: VC {

    override func viewDidLoad() {
        super.viewDidLoad()

        

        // if user is logged in before
        if let isFirstLaunch = UserDefaultsHelper.getData(type: Bool.self, forKey: .isFirstLaunch), isFirstLaunch != true {
            changeRootVC(to: "TabBarViewController")
        } else {
            changeRootVC(to: "SignUpViewController")
        }
    }

}

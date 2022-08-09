//
//  CarDetailViewController.swift
//  CarRental
//
//  Created by Madiapps on 01/08/2022.
//

import UIKit

class CarDetailViewController: VC {

    @IBOutlet weak var bottomContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomContainer.clipsToBounds = true
        bottomContainer.layer.cornerRadius = 60
        bottomContainer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}

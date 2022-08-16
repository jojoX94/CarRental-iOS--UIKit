//
//  CarDetailViewController.swift
//  CarRental
//
//  Created by Madiapps on 01/08/2022.
//

import UIKit

class CarDetailViewController: VC {
    
    var model: Car? = nil

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bottomContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = model {
            img.loadImageUsingCache(withUrl: data.car_image)
        }
        
        bottomContainer.clipsToBounds = true
        bottomContainer.layer.cornerRadius = 60
        bottomContainer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    
}

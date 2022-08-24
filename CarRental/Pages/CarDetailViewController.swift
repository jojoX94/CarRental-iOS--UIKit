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
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var bottomContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    fileprivate func initView() {
        if let data = model {
            img.loadImageUsingCache(withUrl: data.car_image)
            name.text = (data.car_brand?.name.uppercased() ?? "unknown") + " " + data.car_model.uppercased()
            price.text = "$" + data.rent_prize + " per days"
        }
        
        bottomContainer.clipsToBounds = true
        bottomContainer.layer.cornerRadius = 60
        bottomContainer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}

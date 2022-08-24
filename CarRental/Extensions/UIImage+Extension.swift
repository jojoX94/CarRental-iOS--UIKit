//
//  UIImage+Extension.swift
//  CarRental
//
//  Created by Madiapps on 19/08/2022.
//

import Foundation
import UIKit

extension UIImageView {
    
    func makeRounded() {
        
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}

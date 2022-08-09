//
//  UIColor+Extension.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import Foundation
import UIKit

extension UIColor {
    
    var brighterColor: UIColor? {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        if brightness < 1 {
            brightness += 0.05
        }
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
}

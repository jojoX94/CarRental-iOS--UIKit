//
//  TextFieldViewModel.swift
//  CarRental
//
//  Created by Madiapps on 27/07/2022.
//

import Foundation
import UIKit

class TextFieldViewModel {
    var icon: UIImage?
    var placeholder: String? = "Ecrire"
    
    init(placeholder: String, icon: UIImage? = nil) {
        self.placeholder = placeholder
        self.icon = icon ?? UIImage(named: "contact_field")
    }
}

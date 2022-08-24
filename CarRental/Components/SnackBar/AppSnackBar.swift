//
//  AppSnackBar.swift
//  CarRental
//
//  Created by Madiapps on 23/08/2022.
//

import Foundation
import UIKit

class AppSnackBar: SnackBar {
    
    public static func display(type: SnackBarType, contextView: UIView, message: String, duration: Duration) {
        let snackBar = super.make(in: contextView, message: message, duration: duration)
        if case .success = type {
            snackBar.style.background = .systemGreen
            snackBar.style.textColor = .white
        } else if case .error = type {
            snackBar.style.background = .red
            snackBar.style.textColor = .white
        }
        snackBar.show()
    }

}

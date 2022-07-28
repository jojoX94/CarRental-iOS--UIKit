//
//  UIView+Extension.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let cgColor = self.layer.borderColor {
                return UIColor(cgColor: cgColor)
            }
            return UIColor.black
        }
        set {
            self.layer.borderWidth = 1
            if let newValue = newValue {
                self.layer.borderColor = newValue.cgColor
            } else {
                self.layer.borderColor = UIColor.black.cgColor
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }

        for subview in subviews {
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
        }

        return nil
    }
    
    func add(gesture gstRecognizer: UIGestureRecognizer) {
        self.addGestureRecognizer(gstRecognizer)
        self.isUserInteractionEnabled = true
    }
    
  
    func removeSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}

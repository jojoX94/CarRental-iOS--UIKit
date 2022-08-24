//
//  UIView+Extension.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit
import SnapKit

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
    
    func addShadow() {
      self.layer.shadowColor = UIColor.gray.cgColor
      self.layer.shadowOffset = CGSize(width: 1, height: 1)
      self.layer.shadowOpacity = 1
    }
    
    func dropShadow(scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.5
      layer.shadowOffset = CGSize(width: -1, height: 1)
      layer.shadowRadius = 1

      layer.shadowPath = UIBezierPath(rect: bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func setupSubview(_ subview: UIView, setup: (ConstraintViewDSL) -> Void) {
        self.addSubview(subview)
        setup(subview.snp)
    }
    
    func addSwipeGestureAllDirection(action: Selector) {
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: action)
        swipeLeft.direction = .left
        swipeLeft.numberOfTouchesRequired = 1
        self.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: action)
        swipeRight.direction = .right
        swipeRight.numberOfTouchesRequired = 1
        self.addGestureRecognizer(swipeRight)

        let swipeUp = UISwipeGestureRecognizer(target: self, action: action)
        swipeUp.direction = .up
        swipeUp.numberOfTouchesRequired = 1
        self.addGestureRecognizer(swipeUp)

        let swipeDown = UISwipeGestureRecognizer(target: self, action: action)
        swipeDown.direction = .down
        swipeDown.numberOfTouchesRequired = 1
        self.addGestureRecognizer(swipeDown)
    }
}

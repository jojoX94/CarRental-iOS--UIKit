//
//  Button.swift
//  CarRental
//
//  Created by Madiapps on 28/07/2022.
//

import UIKit

@IBDesignable
class Button: UIButton {

    fileprivate var titleString: String?
    fileprivate var titleColorStored: UIColor?
    fileprivate var backgroundColorStored: UIColor?
    fileprivate var _titleSize: CGFloat = 15
    
    @IBInspectable var background: UIColor? {
        get {
            backgroundColor
        }
        set {
            backgroundColorStored = newValue
            backgroundColor = newValue
        }
    }

    @IBInspectable var title: String? {
        get {
            return currentAttributedTitle?.string
        }
        set {
            let newValue = newValue
            titleString = newValue
            let font = UIFont(name: "Roboto-Bold", size: _titleSize)
            if let currentAttributed = currentAttributedTitle, let newValue = newValue, let font = font {
                let mutableAttributed = NSMutableAttributedString(attributedString: currentAttributed)
                let range = NSRange(location: 0, length: currentAttributed.length)
                mutableAttributed.setAttributes([.font: font], range: range)
                mutableAttributed.replaceCharacters(in: range, with: newValue)
                setAttributedTitle(mutableAttributed, for: .normal)
            }
        }
    }
    
    @IBInspectable var titleColor: UIColor? {
        get {
            titleColor(for: .normal)
        }
        set {
            titleColorStored = newValue
            if let currentAttributed = currentAttributedTitle, let newValue = newValue {
                let mutableAttributed = NSMutableAttributedString(attributedString: currentAttributed)
                mutableAttributed.addAttributes([.foregroundColor: newValue], range: NSRange(location: 0, length: currentAttributed.length))
                setAttributedTitle(mutableAttributed, for: .normal)
            }
        }
    }
    
    @IBInspectable var titleSize: CGFloat {
        get {
            if let length = currentAttributedTitle?.length {
                var range = NSRange(location: 0, length: length)
                let fontAttributes = currentAttributedTitle?.attribute(NSAttributedString.Key.font, at: 0, effectiveRange: &range) as? UIFont
                return fontAttributes?.pointSize ?? _titleSize
            }
            return _titleSize
        }
        set {
            _titleSize = newValue
            if let currentAttributed = currentAttributedTitle {
                let font = UIFont(name: "Roboto-Bold", size: newValue)
                if let font = font {
                    let mutableAttributed = NSMutableAttributedString(attributedString: currentAttributed)
                    mutableAttributed.addAttributes([.font: font], range: NSRange(location: 0, length: currentAttributed.length))
                    setAttributedTitle(mutableAttributed, for: .normal)
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    func initialize(){
        
        if let titleString = titleString {
            let mutableAttributeString = NSMutableAttributedString()
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: "Roboto-Bold", size: _titleSize)!,
                .foregroundColor: titleColorStored ?? UIColor.white
            ]
            mutableAttributeString.mutableString.setString(titleString)
            mutableAttributeString.setAttributes(attrs, range: NSRange(location: 0, length: mutableAttributeString.length))
            setAttributedTitle(mutableAttributeString, for: .normal)
        }
        
        layer.cornerRadius = bounds.height/2
        layer.masksToBounds = true
        
        if #unavailable(iOS 15) {
            tintColor = .white
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        backgroundColor = backgroundColor?.brighterColor
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        backgroundColor = backgroundColorStored
    }

}

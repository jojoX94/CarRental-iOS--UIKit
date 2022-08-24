//
//  IconTextField.swift
//  CarRental
//
//  Created by Madiapps on 27/07/2022.
//

import UIKit

@IBDesignable
class IconTextField: UIView {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!

    fileprivate var view: UIView!
    
    @IBInspectable var secure: Bool {
        get {
            textField.isSecureTextEntry
        }
        set {
            textField.isSecureTextEntry = newValue
        }
    }
    
    @IBInspectable var placeholder: String? {
        get {
            return textField.placeholder
        }
        set {
            textField.placeholder = newValue
//            textField.placeholder = newValue?.localized
        }
    }
    
    @IBInspectable var featuredIcon: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    var text: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    var delegate: UITextFieldDelegate? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(view)
        
        self.view = view
        
        textField.delegate = delegate
    }

    
    static func create(for model: TextFieldViewModel, tag: Int = 0, secure: Bool = false) -> IconTextField {
        let form = IconTextField(frame: CGRect(x: 0, y: 0, width: 350, height: 45))
        form.textField.tag = tag
        form.draw(for: model)
        form.secure = secure
        return form
    }
    
    func draw(for model: TextFieldViewModel) {
        featuredIcon = model.icon
        placeholder = model.placeholder
    }
}

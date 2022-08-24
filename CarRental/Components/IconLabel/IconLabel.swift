//
//  IconLabel.swift
//  CarRental
//
//  Created by Madiapps on 19/08/2022.
//

import UIKit

@IBDesignable
class IconLabel: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    fileprivate var view: UIView!
    
    @IBInspectable var icon: UIImage? {
        get {
            imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    @IBInspectable var text: String? {
        get {
            label.text
        }
        set {
            label.text = newValue
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    fileprivate func loadNib() {
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
    }
    
    func draw(for model: IconLabelViewModel) {
        icon = model.icon
        text = model.text
    }
}

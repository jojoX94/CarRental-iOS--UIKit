//
//  IconTextField.swift
//  CarRental
//
//  Created by Madiapps on 27/07/2022.
//

import UIKit

@IBDesignable
class IconTextField: UIView {

    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("IconTextField", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }

    func configure(title: String) {
        label.text = title
    }
}

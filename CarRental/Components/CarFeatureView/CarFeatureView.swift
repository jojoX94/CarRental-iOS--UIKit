//
//  CarFeatureView.swift
//  CarRental
//
//  Created by Madiapps on 01/08/2022.
//

import UIKit

@IBDesignable
class CarFeatureView: UIView {

    @IBOutlet weak var IMG: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    @IBInspectable var image: UIImage? {
        get {
            return IMG.image
        }
        set {
            IMG.image = newValue
        }
    }
    
    @IBInspectable var head: String? {
        get {
            return title.text
        }
        set {
            title.text = newValue
//            textField.placeholder = newValue?.localized
        }
    }
    
    @IBInspectable var body: String? {
        get {
            return subtitle.text
        }
        set {
            subtitle.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("CarFeatureView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }

    func draw() {
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

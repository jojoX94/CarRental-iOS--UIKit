//
//  BrandCollectionViewCell.swift
//  CarRental
//
//  Created by Madiapps on 29/07/2022.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {

    static let identifier = "BrandCollectionViewCell"
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var container: UIView!
    
    var state: Bool = false {
        didSet {
            if state {
                self.container.borderColor = UIColor(named: "primary")
            } else {
                self.container.borderColor = .systemGray5
            }
        }
    }
    
//    override var isSelected: Bool {
//        didSet {
//            if isSelected {
//                
//            }
//            container.borderColor = UIColor(named: "primary")
//        }
//    }
    
    public func configure(imageName: String) {
        img?.image = UIImage(named: imageName)
//        container.dropShadow()
    }
    
    public func configure(model: BrandViewModel) {
        state = model.isSelected
        img.loadImageUsingCache(withUrl: model.imageName)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BrandCollectionViewCell", bundle: nil )
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

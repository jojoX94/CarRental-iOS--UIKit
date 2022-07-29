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
    
    public func configure(imageName: String) {
        img?.image = UIImage(named: imageName)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "BrandCollectionViewCell", bundle: nil )
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

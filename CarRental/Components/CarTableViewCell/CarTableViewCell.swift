//
//  CarTableViewCell.swift
//  CarRental
//
//  Created by Madiapps on 29/07/2022.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    static let identifier = "CarTableViewCell"

    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var img: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil )
    }
    
    public func configure(model: CarViewModel) {
        brandLabel.text = model.brand.uppercased()
        typeLabel.text = model.type
        priceLabel.text = "$" + model.price
        img.loadImageUsingCache(withUrl: model.imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

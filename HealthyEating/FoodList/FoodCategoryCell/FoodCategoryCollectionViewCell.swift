//
//  FoodCategoryCollectionViewCell.swift
//  HealthyEating
//
//  Created by Marivaldo Sena on 11/10/20.
//

import UIKit

@IBDesignable
class FoodCategoryCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

}

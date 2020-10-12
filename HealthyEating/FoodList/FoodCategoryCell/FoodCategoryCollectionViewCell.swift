//
//  FoodCategoryCollectionViewCell.swift
//  HealthyEating
//
//  Created by Marivaldo Sena on 11/10/20.
//

import UIKit

@IBDesignable
class FoodCategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodCategoryLabel: UILabel?
    @IBOutlet weak var viewContainer: UIView?

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
    
    func configure(with item: FoodCategory) {
        self.clearFields()
        
        foodCategoryLabel?.text = item.categoryName
    }
    
    func clearFields() {
        foodCategoryLabel?.text = ""
    }
}

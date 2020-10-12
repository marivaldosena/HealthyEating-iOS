//
//  FoodCollectionViewCell.swift
//  HealthyEating
//
//  Created by Marivaldo Sena on 11/10/20.
//

import UIKit

@IBDesignable
class FoodItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImageView: UIImageView?
    @IBOutlet weak var foodNameLabel: UILabel?
    @IBOutlet weak var foodPriceLabel: UILabel?
    @IBOutlet weak var starImageView: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with item: Food) {
        foodImageView?.image = UIImage(named: item.imageName)
        foodNameLabel?.text = item.name
        foodPriceLabel?.text = String(format: "%.2f", item.price)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Button clicked!")
    }
}

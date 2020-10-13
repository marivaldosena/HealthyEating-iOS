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
    @IBOutlet weak var minusButton: UIButton?
    @IBOutlet weak var plusButton: UIButton?
    
    @IBOutlet weak var imageViewContainer: UIView?
    @IBOutlet weak var parentContainer: UIView?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        minusButton?.layer.cornerRadius = 10.0
        plusButton?.layer.cornerRadius = 10.0
        foodImageView?.layer.cornerRadius = 20.0
        parentContainer?.layer.borderWidth = 1.0
        parentContainer?.layer.borderColor = UIColor.systemGray4.cgColor
        parentContainer?.layer.cornerRadius = 20.0
    }

    func configure(with item: Food) {
        foodImageView?.image = UIImage(named: item.imageName)
        foodNameLabel?.text = item.name
        foodPriceLabel?.text = String(format: "$ %.2f/Kg", item.price)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("Button clicked!")
    }
}

//
//  FoodCollectionViewCell.swift
//  HealthyEating
//
//  Created by Marivaldo Sena on 11/10/20.
//

import UIKit

class FoodItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImageView: UIImageView?
    @IBOutlet weak var foodNameLabel: UILabel?
    @IBOutlet weak var foodPriceLabel: UILabel?
    @IBOutlet weak var starImageView: UIImageView?
    @IBOutlet weak var minusButton: UIButton?
    @IBOutlet weak var plusButton: UIButton?
    @IBOutlet weak var quantityLabel: UILabel?
    
    @IBOutlet weak var imageViewContainer: UIView?
    @IBOutlet weak var parentContainer: UIView?
    
    private var quantity = 0
    private var starImageName = "star"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.customizeCard()
        
        let starImageRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.gestureRecognizerHandler(gestureRecognizer:)))
        let foodImageRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.gestureRecognizerHandler(gestureRecognizer:)))
        
        foodImageView?.addGestureRecognizer(foodImageRecognizer)
        foodImageView?.isUserInteractionEnabled = true
        
        starImageView?.addGestureRecognizer(starImageRecognizer)
        starImageView?.isUserInteractionEnabled = true
    }
    
    private func customizeCard() {
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
        switch sender {
        case minusButton:
            self.changeItemValue(number: -1)
        case plusButton:
            self.changeItemValue(number: 1)
        default:
            break
        }
    }
    
    private func changeItemValue(number: Int) {
        if number > 0 {
            self.quantity += number
        } else {
            if self.quantity > 0 {
                self.quantity += number
            }
        }
        self.updateUIInterface()
    }
    
    @objc func gestureRecognizerHandler(gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            if let imageView = gestureRecognizer.view as? UIImageView {
                switch imageView {
                case starImageView:
                    self.changeStarImage()
                default:
                    break
                }
            }
        }
    }
    
    private func updateUIInterface() {
        if quantity == 0 {
            quantityLabel?.text = "Add To Cart"
        } else {
            quantityLabel?.text = String(self.quantity)
        }
        
        DispatchQueue.main.async {
            self.starImageView?.image = UIImage(systemName: self.starImageName)
        }
    }
    
    private func changeStarImage() {
        switch self.starImageName {
        case "star":
            self.starImageName = "star.fill"
        case "star.fill":
            self.starImageName = "star"
        default:
            self.starImageName = "star"
        }
        self.updateUIInterface()
    }
}

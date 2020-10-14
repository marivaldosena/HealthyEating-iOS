//
//  FruitsListSearchBar.swift
//  HealthyEating
//
//  Created by Marivaldo Sena on 11/10/20.
//

import UIKit

class FoodListSearchBar: UISearchBar {
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
            let textFieldInsideSearchBarLabel = textFieldInsideSearchBar!.value(forKey: "placeholderLabel") as? UILabel
            textFieldInsideSearchBarLabel?.textColor = placeholderColor
        }
    }
    
    @IBInspectable var textColor: UIColor? {
        didSet {
            let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
            textFieldInsideSearchBar?.textColor = textColor
        }
    }
    
    @IBInspectable var magnifyingGlassColor: UIColor? {
        didSet {
            if let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField,
               let glassIconView = textFieldInsideSearchBar.leftView as? UIImageView {
                
                //Magnifying glass
                glassIconView.image = glassIconView.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
                glassIconView.tintColor = magnifyingGlassColor
            }
        }
    }
    
    @IBInspectable var iconBackGroundColor: UIColor? {
        didSet {
            if let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField,
               let glassIconView = textFieldInsideSearchBar.leftView as? UIImageView {
                
                //Magnifying glass
                glassIconView.image = glassIconView.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
                glassIconView.contentMode = .redraw
                glassIconView.backgroundColor = iconBackGroundColor
            }
        }
    }
}

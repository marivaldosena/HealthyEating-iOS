//
//  RoundedButton.swift
//  HealthyEating
//
//  Created by Marivaldo Sena on 11/10/20.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0.0
        }
    }
}

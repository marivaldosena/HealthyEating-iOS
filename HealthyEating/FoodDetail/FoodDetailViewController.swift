//
//  FoodDetailViewController.swift
//  HealthyEating
//
//  Created by Marivaldo Sena on 13/10/20.
//

import UIKit

class FoodDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToList() {
        navigationController?.popViewController(animated: true)
    }
}

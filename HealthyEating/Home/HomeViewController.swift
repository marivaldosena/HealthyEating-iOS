//
//  ViewController.swift
//  HealthyEating
//
//  Created by Marivaldo Sena on 11/10/20.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToFoodList() {
        if let viewController = UIStoryboard(name: "FoodList", bundle: nil).instantiateInitialViewController() as? FoodListViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

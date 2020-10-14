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
        if let uiNavigationController = UIStoryboard(name: "FoodList", bundle: nil).instantiateInitialViewController() as? UINavigationController  {
            
            if let viewController = uiNavigationController.topViewController as? FoodListViewController {
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}

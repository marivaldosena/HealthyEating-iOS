//
//  FruitsListViewController.swift
//  HealthyEating
//
//  Created by Marivaldo Sena on 11/10/20.
//

import UIKit

//MARK: - FoodListViewController: UIViewController
class FoodListViewController: UIViewController {
    @IBOutlet weak var foodCategoriesListCollection: UICollectionView?
    @IBOutlet weak var foodItemsListCollection: UICollectionView?
    
    private var foodCategories = [
        FoodCategory(categoryName: "FRUITS"),
        FoodCategory(categoryName: "VEGETABLE"),
        FoodCategory(categoryName: "JUICE")
        ]
    private var foodItems = [
        Food(name: "Banana", imageName: "Banana", price: 1.20, quantity: 0),
        Food(name: "Apple", imageName: "Apple", price: 1.50, quantity: 0),
        Food(name: "Blueberry", imageName: "BlueBerry", price: 1.30, quantity: 0),
        Food(name: "Apricot", imageName: "Apricot", price: 1.60, quantity: 0)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodCategoriesListCollection?.register(UINib(nibName: "FoodCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCategoryCollectionViewCell")
        
        foodItemsListCollection?.register(UINib(nibName: "FoodItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodItemCollectionViewCell")
        
        foodCategoriesListCollection?.delegate = self
        foodCategoriesListCollection?.dataSource = self
        
        foodItemsListCollection?.delegate = self
        foodItemsListCollection?.dataSource = self
    }
}

//MARK: - FoodListViewController
extension FoodListViewController {
    static func goToDetail(foodItem: Food?) {
        let parentController = self.init()
        
        if let viewController = UIStoryboard(name: "FoodDetail", bundle: nil).instantiateInitialViewController() as? FoodDetailViewController {
            parentController.navigationController?.pushViewController(viewController, animated: true)
        } 
    }
}

//MARK: - FoodListViewController: UICollectionViewDelegate
extension FoodListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = UIStoryboard(name: "FoodDetail", bundle: nil).instantiateInitialViewController() as? FoodDetailViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

//MARK: - FoodListViewController: UICollectionViewDataSource
extension FoodListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case foodItemsListCollection:
            return foodItems.count
        case foodCategoriesListCollection:
            return foodCategories.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case foodItemsListCollection:
            return self.getFoodItemCellInstance(collectionView, indexPath)
        case foodCategoriesListCollection:
            return self.getFoodCategoryCellInstance(collectionView, indexPath)
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCategoryCollectionViewCell", for: indexPath)
        }
    }
    
    private func getFoodItemCellInstance(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> FoodItemCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodItemCollectionViewCell", for: indexPath) as! FoodItemCollectionViewCell
        let foodItem = foodItems[indexPath.row]
        
        cell.configure(with: foodItem)
        
        return cell
    }
    
    private func getFoodCategoryCellInstance(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> FoodCategoryCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCategoryCollectionViewCell", for: indexPath) as! FoodCategoryCollectionViewCell
        let category = foodCategories[indexPath.row]
        
        cell.configure(with: category)
            
        return cell
    }
}

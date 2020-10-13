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
        Food(name: "Banana", imageName: "Banana", price: 1.20),
        Food(name: "Apple", imageName: "Apple", price: 1.50),
        Food(name: "Blueberry", imageName: "Blueberry", price: 1.30),
        Food(name: "Apricot", imageName: "Apricot", price: 1.60)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodCategoriesListCollection?.register(UINib(nibName: "FoodCategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCategoryCollectionViewCell")
        
        foodItemsListCollection?.register(UINib(nibName: "FoodItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodItemCollectionViewCell")
        
        foodCategoriesListCollection?.delegate = self
        foodCategoriesListCollection?.dataSource = self
        
        foodItemsListCollection?.delegate = self
        foodItemsListCollection?.dataSource = self
        
        if let layout = foodItemsListCollection?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 10
                layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
                let size = CGSize(width:(foodItemsListCollection!.bounds.width-30)/2, height: 250)
                layout.itemSize = size
        }
    }
}

//MARK: - FoodListViewController: UICollectionViewDelegate
extension FoodListViewController: UICollectionViewDelegate {
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

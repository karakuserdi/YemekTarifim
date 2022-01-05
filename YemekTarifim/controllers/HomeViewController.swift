//
//  HomeViewController.swift
//  YemekTarifim
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var trendCollectionView: UICollectionView!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var trendListesi = [Food]()
    var foodListesi = [Food]()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionUI()
        let r = Recipe(recipe_id: 1, recipe_contents: [["1 adet soğan", "1 kaşık zeytin yağı", "1 kuru makarna", "3 adet domates", "1/2 çay kaşığı kara biber"],["Zeytinleri irice doğruyoruz. Kapya biberi, maydanoz ve dereotunu minik minik doğruyoruz.Limon suyu, zeytinyağı ve nar ekşisini karıştırıyoruz. Diğer malzemelerle karıştırıp servis ediyoruz. Gerekirse tuz ilave ediyoruz. Afiyet Olsun."]])
        
        let f1 = Food(food_id: 1, food_name: "Yemek 1", food_image: "yemek7", food_isLiked: "false", recipe: r)
        let f2 = Food(food_id: 2, food_name: "Yemek 2", food_image: "yemek7", food_isLiked: "false", recipe: r)
        let f3 = Food(food_id: 3, food_name: "Yemek 3", food_image: "yemek7", food_isLiked: "true", recipe: r)
        let f4 = Food(food_id: 4, food_name: "Yemek 4", food_image: "yemek7", food_isLiked: "false", recipe: r)
        let f5 = Food(food_id: 5, food_name: "Yemek 5", food_image: "yemek7", food_isLiked: "true", recipe: r)
        let f6 = Food(food_id: 6, food_name: "Yemek 6", food_image: "yemek7", food_isLiked: "false", recipe: r)
        let f7 = Food(food_id: 7, food_name: "Yemek 7", food_image: "yemek7", food_isLiked: "true", recipe: r)
        
        foodListesi = [f1,f2,f3,f4,f5,f6,f7]

        trendListesi = foodListesi.filter {(like) -> Bool in
            return like.food_isLiked == "true"
        }
        
    }
    
    //MARK: - configureCollectionUI
    func configureCollectionUI(){
        //Trend
        trendCollectionView.tag = 0
        trendCollectionView.delegate = self
        trendCollectionView.dataSource = self
        
        let trendLayout = UICollectionViewFlowLayout()
        trendLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        trendLayout.minimumLineSpacing = 16
        trendLayout.scrollDirection = .horizontal
        
        trendLayout.itemSize = CGSize(width: 150, height: 200)
        trendCollectionView.collectionViewLayout = trendLayout
        
        //Food
        foodCollectionView.tag = 1
        foodCollectionView.delegate = self
        foodCollectionView.dataSource = self
        
        let foodLayout = UICollectionViewFlowLayout()
        foodLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        foodLayout.minimumLineSpacing = 20
        foodLayout.minimumInteritemSpacing = 20
        
        let weight = foodCollectionView.frame.size.width
        let itemSize = (weight - 60) / 3
        foodLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        foodCollectionView.collectionViewLayout = foodLayout
    }
}

//MARK: - UICollectionViewDelegate,UICollectionViewDataSource, Prepare
extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
            return trendListesi.count
        }else{
            return foodListesi.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trendCell", for: indexPath) as! TrendCell
            let trend = trendListesi[indexPath.row]
            
            cell.food = trend
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCell
            let food = foodListesi[indexPath.row]
            cell.food = food
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0{
            let food = trendListesi[indexPath.row]
            performSegue(withIdentifier: "toDetails", sender: food)
        }else{
            let food = foodListesi[indexPath.row]
            performSegue(withIdentifier: "toDetails", sender: food)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails"{
            let food = sender as? Food
            let destinationVC = segue.destination as! FoodDetailsViewController
            destinationVC.food = food
        }
    }
}

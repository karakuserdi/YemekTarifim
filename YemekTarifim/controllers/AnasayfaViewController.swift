//
//  AnasayfaViewController.swift
//  YemekTarifim
///Users/rizaerdikarakus/Desktop/Bootcamp/CollectionDeneme/CollectionDeneme.xcodeproj
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import UIKit

class AnasayfaViewController: UIViewController {

    @IBOutlet weak var trendCollectionView: UICollectionView!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    var trendListesi = [Trends]()
    var foodListesi = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionUI()
        
        let t1 = Trends(trend_id: 1, trend_name: "Chopped", trend_subname: "Scallions & radishes", trend_image: "yemek7")
        let t2 = Trends(trend_id: 2, trend_name: "Chopped Spring", trend_subname: "Scallions & radishes", trend_image: "yemek7")
        let t3 = Trends(trend_id: 3, trend_name: "Spring", trend_subname: "Scallions & radishes", trend_image: "yemek7")
        let t4 = Trends(trend_id: 4, trend_name: "Chopped Spring", trend_subname: "Scallions & radishes", trend_image: "yemek7")
        let t5 = Trends(trend_id: 5, trend_name: "Chopped Spring", trend_subname: "Scallions & radishes", trend_image: "yemek7")
        let t6 = Trends(trend_id: 6, trend_name: "Chopped Spring", trend_subname: "Scallions & radishes", trend_image: "yemek7")
        let t7 = Trends(trend_id: 7, trend_name: "Chopped Spring", trend_subname: "Scallions & radishes", trend_image: "yemek7")
        
        trendListesi = [t1,t2,t3,t4,t5,t6,t7]
        
        let f1 = Food(food_id: 1, food_name: "Yemek 4", food_image: "yemek7")
        let f2 = Food(food_id: 2, food_name: "Yemek 7", food_image: "yemek7")
        let f3 = Food(food_id: 3, food_name: "Yemek 4", food_image: "yemek7")
        let f4 = Food(food_id: 4, food_name: "Yemek 7", food_image: "yemek7")
        let f5 = Food(food_id: 5, food_name: "Yemek 4", food_image: "yemek7")
        let f6 = Food(food_id: 6, food_name: "Yemek 7", food_image: "yemek7")
        let f7 = Food(food_id: 7, food_name: "Yemek 4", food_image: "yemek7")
        
        foodListesi = [f1,f2,f3,f4,f5,f6,f7]
        

        
    }
    
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

extension AnasayfaViewController: UICollectionViewDelegate,UICollectionViewDataSource{
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
            
            cell.trend = trend
            return cell
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCell", for: indexPath) as! FoodCell
            let food = foodListesi[indexPath.row]
            cell.food = food
            return cell
        }
    }
    
    
    
    
}

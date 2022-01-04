//
//  AnasayfaViewController.swift
//  YemekTarifim
///Users/rizaerdikarakus/Desktop/Bootcamp/CollectionDeneme/CollectionDeneme.xcodeproj
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import UIKit

class AnasayfaViewController: UIViewController {

    @IBOutlet weak var trendCollectionView: UICollectionView!
    
    var trendListesi = [Trends]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionUI()
        
        let t1 = Trends(trend_id: 1, trend_ad: "Yemek 1", trend_resim: "yemek1")
        let t2 = Trends(trend_id: 2, trend_ad: "Yemek 2", trend_resim: "yemek2")
        let t3 = Trends(trend_id: 3, trend_ad: "Yemek 3", trend_resim: "yemek3")
        let t4 = Trends(trend_id: 4, trend_ad: "Yemek 4", trend_resim: "yemek4")
        let t5 = Trends(trend_id: 5, trend_ad: "Yemek 5", trend_resim: "yemek5")
        let t6 = Trends(trend_id: 6, trend_ad: "Yemek 6", trend_resim: "yemek6")
        let t7 = Trends(trend_id: 7, trend_ad: "Yemek 7", trend_resim: "yemek7")
        
        trendListesi = [t1,t2,t3,t4,t5,t6,t7]

        
    }
    
    func configureCollectionUI(){
        trendCollectionView.delegate = self
        trendCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        
        let height = trendCollectionView.frame.height
        layout.itemSize = CGSize(width: height, height: height)
        trendCollectionView.collectionViewLayout = layout
    }

}

extension AnasayfaViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trendCell", for: indexPath) as! TrendCell
        let trend = trendListesi[indexPath.row]
        
        cell.trendFoodImageView.image = UIImage(named: trend.trend_resim!)
        return cell
    }
    
    
}

//
//  TrendCell.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import UIKit

class TrendCell: UICollectionViewCell {
    
    @IBOutlet weak var trendFoodImageView: UIImageView!
    @IBOutlet weak var trendView: UIView!
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodSubLabel: UILabel!
    @IBOutlet weak var calLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func awakeFromNib() {
        trendView.layer.cornerRadius = 20
        
        trendView.layer.shadowColor = UIColor.lightGray.cgColor
        trendView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        trendView.layer.shadowRadius = 1
        trendView.layer.shadowOpacity = 0.5
        
        trendView.layer.masksToBounds = false

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    @IBAction func likeButtonPressed(_ sender: Any) {
        print("Button Pressed")
    }
    
}

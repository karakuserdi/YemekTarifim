//
//  TrendCell.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import UIKit

class TrendCell: UICollectionViewCell {
    
    @IBOutlet weak var trendFoodImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    override func awakeFromNib() {
        trendFoodImageView.layer.cornerRadius = 10
        trendFoodImageView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

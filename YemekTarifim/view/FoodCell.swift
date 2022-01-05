//
//  FoodCell.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import UIKit

class FoodCell: UICollectionViewCell {
    
    var food:Food?{
        didSet{
            configure()
        }
    }
    
    @IBOutlet weak var foodView: UIView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        foodView.layer.cornerRadius = 10
        foodView.layer.shadowColor = UIColor.lightGray.cgColor
        foodView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        foodView.layer.shadowRadius = 1
        foodView.layer.shadowOpacity = 0.5
        foodView.layer.masksToBounds = false
    }
    
    func configure(){
        guard let food = food else {return}
        let viewModel = FoodViewModel(food: food)
        
        foodImageView.image = UIImage(named: viewModel.foodImageView)
        foodNameLabel.text = viewModel.foodName
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    
}

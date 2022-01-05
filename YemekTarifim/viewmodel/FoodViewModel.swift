//
//  FoodViewModel.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import Foundation
import UIKit


struct FoodViewModel{
    let food:Food
    
    var isLike:String{
        if let isLiked = food.food_isLiked{
            return isLiked
        }
        return ""
    }
    
    
    var foodImageView: String{
        if let img = food.food_image{
            return img
        }
        return ""
    }
    
    var foodName:String{
        if let name = food.food_name{
            return name
        }
        return ""
    }
    
    
    init(food:Food){
        self.food = food
    }
}

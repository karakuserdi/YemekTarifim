//
//  Foods.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import Foundation

class Food{
    var food_id:Int?
    var food_name:String?
    var food_image:String?
    
    init(){}
    
    init(food_id:Int ,food_name:String ,food_image:String){
        self.food_id = food_id
        self.food_name = food_name
        self.food_image = food_image
    }
}

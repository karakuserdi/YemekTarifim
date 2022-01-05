//
//  Recipe.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 5.01.2022.
//

import Foundation

class Recipe:Codable{
    var recipe_id:String?
    var recipe_contents:[[String]]?
    
    init(recipe_id:String,recipe_contents:[[String]]){
        self.recipe_id = recipe_id
        self.recipe_contents = recipe_contents
    }
}

//
//  Recipe.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 5.01.2022.
//

import Foundation

class Recipe{
    var recipe_id:Int?
    var recipe_contents:[[String]]?
    
    init(recipe_id:Int,recipe_contents:[[String]]){
        self.recipe_id = recipe_id
        self.recipe_contents = recipe_contents
    }
}

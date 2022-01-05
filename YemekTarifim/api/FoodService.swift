//
//  FoodService.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 5.01.2022.
//

import Foundation

class FoodService{
    static let shared = FoodService()
    func parseJSON() ->[Food]? {
        guard let url = Bundle.main.url(forResource: "yemektarifim", withExtension: "json") else {
            return nil
        }

        do {
            let jsonData = try Data(contentsOf: url)
            let data = try JSONDecoder().decode(FoodResult.self, from: jsonData)
            
            var food:[Food]?
            food = data.food
            
            return food
        }
        catch {
            print("\n====> error: \(error)" )
            return nil
        }
    }
}

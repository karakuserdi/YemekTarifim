//
//  Trends.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import Foundation

class Trends{
    var trend_id:Int?
    var trend_ad:String?
    var trend_resim:String?
    
    init(){}
    
    init(trend_id:Int,trend_ad:String,trend_resim:String){
        self.trend_id = trend_id
        self.trend_ad = trend_ad
        self.trend_resim = trend_resim
    }
}

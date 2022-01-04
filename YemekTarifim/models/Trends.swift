//
//  Trends.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import Foundation

class Trends{
    var trend_id:Int?
    var trend_name:String?
    var trend_subname:String?
    var trend_image:String?
    
    init(){}
    
    init(trend_id:Int,trend_name:String,trend_subname:String,trend_image:String){
        self.trend_id = trend_id
        self.trend_name = trend_name
        self.trend_subname = trend_subname
        self.trend_image = trend_image
    }
}

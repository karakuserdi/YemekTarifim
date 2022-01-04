//
//  TrendViewModel.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 4.01.2022.
//

import Foundation
import UIKit

struct TrendViewModel{
    let tred:Trends
    
    var trendImageView: String{
        return tred.trend_image ?? ""
    }
    
    var trendName: String{
        return tred.trend_name ?? ""
    }
    
    var trendSubname: String{
        return tred.trend_subname ?? ""
    }
    
    
    init(trend:Trends){
        self.tred = trend
    }
}

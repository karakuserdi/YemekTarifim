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
        if let img = tred.trend_image{
            return img
        }
        
        return ""
    }
    
    var trendName: String{
        if let name = tred.trend_name{
            return name
        }
        
        return ""
    }
    
    var trendSubname: String{
        if let name = tred.trend_subname{
            return name
        }
        
        return ""
    }
    
    
    init(trend:Trends){
        self.tred = trend
    }
}

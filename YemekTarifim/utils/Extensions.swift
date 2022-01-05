//
//  Extensions.swift
//  YemekTarifim
//
//  Created by Riza Erdi Karakus on 5.01.2022.
//

import UIKit

extension UIView{
    func viewConfigure(view: UIView){
        let radius = view.frame.size.height
        
        view.layer.cornerRadius = radius / 2
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 2
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.1
    }
}

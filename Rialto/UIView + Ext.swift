//
//  UIView + Ext.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import UIKit
extension UIView {
    
    func addSubViews(_ views: UIView...){
        views.forEach({
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
    }
}

//
//  SellBuyView.swift
//  Rialto
//
//  Created by macbook on 24.05.2023.
//

import Foundation
import UIKit
class SellBuyView: UIView {
    
    convenience init(name: String) {
        self.init()
    
        let label = UILabel(text: name, font: .interFont(offSize: 24, weight: .medium), color: .white)

        self.addSubViews(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
}

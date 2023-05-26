//
//  BalanceView.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import Foundation
import UIKit
final class BalanceView: UIView {
    
    private let textColor = UIColor(red: 0.757, green: 0.761, blue: 0.784, alpha: 1)
    private lazy var balabceLabel = UILabel(text: "Balance", font: .interFont(offSize: 12, weight: .medium), color: textColor)
    private lazy var countLabel = UILabel(text: "10 000", font: .sFProTextFont(offSize: 16, weight: .bold), color: .white)
   
    init(){
        super.init(frame: .zero)
        self.backgroundColor = UIColor(red: 0.2, green: 0.216, blue: 0.286, alpha: 1)
        initialize()
        balabceLabel.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func initialize() {
    
        lazy var fullStackview = UIStackView(axis: .vertical, distribution: .fill, spacing: 7, views: [balabceLabel, countLabel])
        
        self.addSubViews(fullStackview)
        
        NSLayoutConstraint.activate([
            fullStackview.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            fullStackview.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fullStackview.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -8),
       
        ])
    }
}

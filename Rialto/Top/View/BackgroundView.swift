//
//  BackgroundView.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import UIKit
final class BackgroundView: UIView {
    private let textColor = UIColor(red: 0.757, green: 0.761, blue: 0.784, alpha: 1)
    private lazy var numerLabel = UILabel(text: "№", font: .interFont(offSize: 14, weight: .medium), color: textColor)
    private lazy var countryLabel = UILabel(text: "Country", font: .interFont(offSize: 14, weight: .medium), color: textColor)
    private lazy var nameLabel = UILabel(text: "Name", font: .interFont(offSize: 14, weight: .medium), color: textColor)
    private lazy var depositLabel = UILabel(text: "Deposit", font: .interFont(offSize: 14, weight: .medium), color: textColor)
    private lazy var profitLabel = UILabel(text: "Profit", font: .interFont(offSize: 14, weight: .medium), color: textColor)
    
    
    init(){
        super.init(frame: .zero)
        self.backgroundColor = UIColor(red: 0.18, green: 0.188, blue: 0.243, alpha: 1)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func initialize() {
        
         let view = UIView()
   
        view.backgroundColor = .red
        lazy var leftStackView = UIStackView(axis: .horizontal, distribution: .equalSpacing, spacing: 30, views: [numerLabel, countryLabel, nameLabel])
        lazy var rightStackView = UIStackView(axis: .horizontal, distribution: .equalSpacing, spacing: 45, views: [depositLabel, profitLabel])
        lazy var fullStackview = UIStackView(axis: .horizontal, distribution: .equalSpacing, spacing: 0, views: [leftStackView, rightStackView])
        
        self.addSubViews(fullStackview)
        
        NSLayoutConstraint.activate([
            fullStackview.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            fullStackview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            fullStackview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            fullStackview.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -13),
        ])
    }
}

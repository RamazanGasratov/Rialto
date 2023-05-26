//
//  CurrencyView.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import Foundation
import UIKit
final class CurrencyView: UIView {
    
    private let textColor = UIColor(red: 0.757, green: 0.761, blue: 0.784, alpha: 1)
   lazy var balabceLabel = UILabel(text: "GPB/USD", font: .sFProTextFont(offSize: 16, weight: .bold), color: .white)
    private lazy var actionButton = UIButton()
   
    init(){
        super.init(frame: .zero)
        self.backgroundColor = UIColor(red: 0.2, green: 0.216, blue: 0.286, alpha: 1)
        initialize()
        balabceLabel.textAlignment = .center
        actionButton.tintColor = .white
        let configuration = UIImage.SymbolConfiguration(pointSize: 20)
        actionButton.setImage(UIImage(systemName: "chevron.right", withConfiguration: configuration ), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func initialize() {
        
        let view1 = UIView()
        view1.backgroundColor = .red
        view1.frame = .init(x: 0, y: 0, width: 60, height: 5)
    
        lazy var fullStackview = UIStackView(axis: .horizontal, distribution: .fillProportionally, spacing: 110, views: [view1, balabceLabel, actionButton])
        
        self.addSubViews(fullStackview)
        
        NSLayoutConstraint.activate([
            
            fullStackview.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            fullStackview.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fullStackview.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -8),
       
        ])
    }
}

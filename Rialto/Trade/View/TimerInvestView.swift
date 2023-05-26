//
//  timerInvestView.swift
//  Rialto
//
//  Created by macbook on 24.05.2023.
//

import UIKit
class TimerInvestView: UIView {
//    var labelCount: UILabel!
    lazy var minusButton = UIButton()
    lazy var plusButton = UIButton()
    lazy var textFeild = UITextField()
    convenience init(labelName: String, count: String) {
        self.init()
        
        textFeild.delegate = self as? any UITextFieldDelegate
        textFeild.textColor = .white
        textFeild.keyboardType = .phonePad
        textFeild.text = count
        
        let textColor = UIColor(red: 0.757, green: 0.761, blue: 0.784, alpha: 1)
        let label = UILabel(text: labelName, font: .interFont(offSize: 12, weight: .medium), color: textColor)
        label.textAlignment = .center
      
        let configuration = UIImage.SymbolConfiguration(pointSize: 17)
        minusButton.setImage(UIImage(systemName: "minus.circle", withConfiguration: configuration ), for: .normal)
        minusButton.tintColor = textColor
        
        plusButton.setImage(UIImage(systemName: "plus.circle", withConfiguration: configuration ), for: .normal)
        plusButton.tintColor = textColor
        
        lazy var bottomStackView = UIStackView(axis: .horizontal, distribution: .equalSpacing, spacing: 5, views: [minusButton, textFeild, plusButton])
        
        lazy var fullStackView = UIStackView(axis: .vertical, distribution: .equalSpacing, spacing: 5, views: [label, bottomStackView])
        self.backgroundColor = UIColor(red: 0.2, green: 0.216, blue: 0.286, alpha: 1)
        self.addSubViews(fullStackView)
        NSLayoutConstraint.activate([
            fullStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            fullStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            fullStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            fullStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
}

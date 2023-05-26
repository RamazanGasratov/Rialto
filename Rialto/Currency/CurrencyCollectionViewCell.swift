//
//  CurrencyCollectionViewCell.swift
//  Rialto
//
//  Created by macbook on 24.05.2023.
//

import Foundation
import UIKit

class CurrencyCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            updateCellAppearance()
        }
    }
    
    private func updateCellAppearance() {
        if isSelected {
            contentView.backgroundColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1)
        } else {
            contentView.backgroundColor = UIColor(red: 0.2, green: 0.216, blue: 0.286, alpha: 1)
        }
    }
    
    private lazy var titleLable = UILabel(text: "", font: .sFProTextFont(offSize: 14, weight: .semibold), color: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        titleLable.textAlignment = .center
        contentView.addSubViews(titleLable)
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        contentView.backgroundColor = UIColor(red: 0.2, green: 0.216, blue: 0.286, alpha: 1)
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            titleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            titleLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18)
        ])
    }
    //MARK: - adding content
    func setContent(_ model: CurrencyModel){
        titleLable.text = model.nameCurrency
    }
}

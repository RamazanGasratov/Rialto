//
//  TopTableViewCell.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//
//
import UIKit
class TopTableViewCell: UITableViewCell {
    
    private lazy var numberLabel = UILabel(text: "", font: .interFont(offSize: 12, weight: .medium), color: .white)
    private lazy var countryImage = UIImageView()
    private lazy var nameLabel = UILabel(text: "", font: .interFont(offSize: 12, weight: .medium), color: .white)
     lazy var depositLabel = UILabel(text: "", font: .interFont(offSize: 12, weight: .medium), color: .white)
     lazy var profitLabel = UILabel(text: "", font: .interFont(offSize: 12, weight: .medium), color: .systemGreen)
    
    private var timer: Timer?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        depositLabel.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration(_ model: TopModel) {
        self.numberLabel.text = model.number
        self.countryImage.image = UIImage(named: model.image ?? "")
        self.nameLabel.text = model.name
        self.depositLabel.text = String("$\(model.deposit)")
        self.profitLabel.text = String("$\(model.profit)")
    }
    
    private func setupConstraints() {
        lazy var leftStackView = UIStackView(axis: .horizontal, distribution: .equalSpacing, spacing: 45, views: [numberLabel, countryImage, nameLabel])
        lazy var rightStackView = UIStackView(axis: .horizontal, distribution: .fill, spacing: 40, views: [depositLabel, profitLabel])
        lazy var fullStackview = UIStackView(axis: .horizontal, distribution: .equalSpacing, spacing: 0, views: [leftStackView, rightStackView])
        
        contentView.addSubViews(fullStackview)
        
        
        NSLayoutConstraint.activate([
            fullStackview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            fullStackview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            fullStackview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            fullStackview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
}


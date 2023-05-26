//
//  CurrencyViewController.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import Foundation
import UIKit

protocol CurrencyViewControllerProtocol: AnyObject {
    func selecText(text: String? )
}

class CurrencyViewController: ViewController {
  
    weak var delegate: CurrencyViewControllerProtocol?
    
    private var presenter: CurrencyPresenter
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, scrolling: .vertical, spasing: 21, sectionSpasing: UIEdgeInsets.init(top: 37, left: 37, bottom: 50, right: 37))
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        navigationBar()
        collectionView.dataSource = self
        collectionView.delegate = self
      collectionView.register(CurrencyCollectionViewCell.self, forCellWithReuseIdentifier: "CurrencyCollectionViewCell")
        view.addSubViews(collectionView)
    }
    
    override init(){
        presenter = CurrencyPresenter()
        super.init()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func navigationBar() {
        let label = UILabel()
        label.text = "Currency pair"
        label.font = .interFont(offSize: 22, weight: .medium)
        label.textColor = .white
        navigationItem.backButtonDisplayMode = .generic
        navigationItem.titleView = label
    }
}


extension CurrencyViewController: CurrencyPresenterProtocol{
    func updateCurrensy(with text: String) {
    }
}

//MARK: - Delegate DataSource CollectionView
extension CurrencyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.currencyModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = presenter.currencyModel[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrencyCollectionViewCell", for: indexPath) as? CurrencyCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setContent(model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrencyCollectionViewCell", for: indexPath)
        let model = presenter.currencyModel[indexPath.item]
        delegate?.selecText(text: model.nameCurrency)
    }
    
    //MARK: - Size Cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = setupSize(count: 2, spacing: 37.0, cellWidth: 143, cellHeight: 54)
        return size
        
        
    }
    private func setupSize(count: Int, spacing: Double, cellWidth: Double, cellHeight: Double) -> CGSize {
        let collectionViewWidht = collectionView.bounds.width
        let fullSpacing = spacing * Double(count + 1)
        let width = (collectionViewWidht - fullSpacing) / Double(count)
        let height = width * cellHeight / cellWidth
        return CGSize(width: width, height: height)
    }
}

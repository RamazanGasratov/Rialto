//
//  CurrencyPresenter.swift
//  Rialto
//
//  Created by macbook on 24.05.2023.
//

import Foundation
import Foundation

protocol CurrencyPresenterProtocol: AnyObject {
    func updateCurrensy(with text: String)
}

typealias CurrencyPresenterDelegate = CurrencyPresenterProtocol & CurrencyViewController

final class CurrencyPresenter {

    weak var delegate: CurrencyPresenterDelegate?
    
    var currencyModel = CurrencyModel.setupMenu()
}

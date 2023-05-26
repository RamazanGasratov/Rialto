//
//  CurrencyModel.swift
//  Rialto
//
//  Created by macbook on 24.05.2023.
//

import Foundation
struct CurrencyModel {
    let nameCurrency: String
    
    static func setupMenu() -> [CurrencyModel] {
        return [
            CurrencyModel(nameCurrency: "EUR/USD"),
            CurrencyModel(nameCurrency: "GPB/USD"),
            CurrencyModel(nameCurrency: "EUR/USD"),
            CurrencyModel(nameCurrency: "EUR/USD"),
            CurrencyModel(nameCurrency: "GPB/USD"),
            CurrencyModel(nameCurrency: "EUR/USD"),
            CurrencyModel(nameCurrency: "EUR/USD"),
            CurrencyModel(nameCurrency: "GPB/USD"),
            CurrencyModel(nameCurrency: "EUR/USD"),
            CurrencyModel(nameCurrency: "EUR/USD"),
            CurrencyModel(nameCurrency: "EUR/USD"),
            CurrencyModel(nameCurrency: "GPB/USD"),
            CurrencyModel(nameCurrency: "EUR/USD"),
            CurrencyModel(nameCurrency: "GPB/USD")
        ]
    }
}

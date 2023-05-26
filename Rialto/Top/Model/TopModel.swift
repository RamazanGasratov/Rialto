//
//  TopModel.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import Foundation
import Foundation

struct TopModel {
    let number: String
    let image: String?
    let name: String
    var deposit: Int
    var profit: Int
    
    static func setupMenu() -> [TopModel] {
        return [
            TopModel(number: "1", image: "105-cameroon", name: "Oliver", deposit: 10000, profit: 384000),
            TopModel(number: "2", image: "108-armenia", name: "Jack", deposit: 10000, profit: 344500),
            TopModel(number: "3", image: "118-malasya", name: "Harry", deposit: 10000, profit: 10000),
            TopModel(number: "4", image: "121-new-zealand", name: "Jacob", deposit: 10000, profit: 94756),
            TopModel(number: "5", image: "177-colombia", name: "Charly", deposit: 10000, profit: 10000),
            TopModel(number: "6", image: "180-french-polynesia", name: "Thomas", deposit: 10000, profit: 328732),
            TopModel(number: "7", image: "198-argentina", name: "Geogre", deposit: 10000, profit: 10000),
            TopModel(number: "8", image: "200-south-africa", name: "Oscar", deposit: 10000, profit: 293844),
            TopModel(number: "9", image: "210-grenada", name: "James", deposit: 10000, profit: 73384),
            TopModel(number: "10", image: "248-russia", name: "Roma", deposit: 10000, profit: 494733),
            
        ]
    }
}

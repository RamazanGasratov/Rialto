//
//  TopPresenter.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import Foundation

protocol TopPresenterProtocol: AnyObject {
    func updateDepositLabel(with text: String, at index: Int)
    func updateProfitLabel(with text: String, at index: Int)
}

typealias TopPresenterDelegate = TopPresenterProtocol & TopViewController

final class TopPresenter {
    
    init(delegate: TopPresenterDelegate) {
        self.delegate = delegate
        startTimer()
    }
    
    weak var delegate: TopPresenterDelegate?
    
    var topModel = TopModel.setupMenu()
}
//MARK: - Input data
extension TopPresenter {
    private func startTimer() {
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(updateLabels), userInfo: nil, repeats: true)
    }
    
    @objc private func updateLabels() {
        for (index, var model) in topModel.enumerated() {
            let depositIncrement = generateRandomIncrement()
            let profitIncrement = generateRandomIncrement()
            
            model.deposit += depositIncrement
            model.profit += profitIncrement
            
            let depositText = formatValue(model.deposit)
            let profitText = formatValue(model.profit)
            
            delegate?.updateDepositLabel(with: depositText, at: index)
            delegate?.updateProfitLabel(with: profitText, at: index)
        }
    }
    
    private func generateRandomIncrement() -> Int {
        let randomIncrement = Int(arc4random_uniform(101)) + 50
        return randomIncrement
    }
    
    private func formatValue(_ value: Int) -> String {
        return "$\(value)"
    }
}

//
//  TradeViewController.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import Foundation
import UIKit
import WebKit
import UserNotifications

class TradeViewController: ViewController, WKNavigationDelegate {
    
    private let centr = UNUserNotificationCenter.current()
    
private lazy var balanceView = BalanceView()
    
    private lazy var currencyView = CurrencyView()
    
    private let viewBottom = UIView()
    
    private var seconds: Int = 0
    private var timer: Timer?

    private var widgetURL: URL?
    
    private lazy var timerView = TimerInvestView(labelName: "Timer", count: "00:00")
    
    private lazy var invest = TimerInvestView(labelName: "Investment", count: "1,000")
    
    private lazy var sellView = SellBuyView(name: "Sell")
    private lazy var buyView = SellBuyView(name: "Buy")
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar()
        setupConstraints()
        invest.textFeild.delegate = self
        setupView()
        setupKeyboardHiding()
        centr.delegate = self
        widgetURL = URL(string: "https://www.tradingview.com/chart/LmAFu6o4/?symbol=NASDAQ%3AAAPL&utm_source=ru.tradingview.com&utm_medium=widget_new&utm_campaign=chart&utm_term=NASDAQ%3AAAPL")
        webView.navigationDelegate = self
                let currency = "GPB/USD"
                guard let url = URL(string: "https://www.tradingview.com/chart/?symbol=\(currency)") else {
                    return
                }
                let request = URLRequest(url: url)
                webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
           let cssString = "document.body.style.backgroundColor = 'black'; document.body.style.color = 'white';" // JavaScript code to modify the background color to black and text color to white
           
           webView.evaluateJavaScript(cssString, completionHandler: nil)
       }
    
    let webView = WKWebView()
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func navigationBar() {
        let label = UILabel()
        label.text = "Trade"
        label.font = .interFont(offSize: 22, weight: .medium)
        label.textColor = .white
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.titleView = label
    }
    
    private func setupConstraints() {
        viewBottom.backgroundColor = UIColor(red: 0.11, green: 0.122, blue: 0.176, alpha: 1)
      
        currencyView.layer.cornerRadius = 12
        currencyView.clipsToBounds = true
        let fullStackView = UIStackView(axis: .vertical, distribution: .fill, spacing: 10, views: [webView, viewBottom])
        timerView.layer.cornerRadius = 12
        timerView.clipsToBounds = true
        updateCountLabel()
        invest.layer.cornerRadius = 12
        invest.clipsToBounds = true
        
        
        let sellBuyStackView = UIStackView(axis: .horizontal, distribution: .fillProportionally, spacing: 11, views: [sellView, buyView])
        let timerInvestStackView = UIStackView(axis: .horizontal, distribution: .fillProportionally, spacing: 11, views: [timerView, invest])
        let viewBottomStackView = UIStackView(axis: .vertical, distribution: .fill, spacing: 10, views: [currencyView, timerInvestStackView, sellBuyStackView])
        
        view.addSubViews(fullStackView, balanceView)
        viewBottom.addSubViews(viewBottomStackView)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            balanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            balanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            fullStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            fullStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fullStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            viewBottomStackView.topAnchor.constraint(equalTo: viewBottom.topAnchor, constant: 5),
            viewBottomStackView.leadingAnchor.constraint(equalTo: viewBottom.leadingAnchor, constant: 30),
            viewBottomStackView.trailingAnchor.constraint(equalTo: viewBottom.trailingAnchor, constant: -30),
            viewBottomStackView.bottomAnchor.constraint(equalTo: viewBottom.safeAreaLayoutGuide.bottomAnchor, constant: -12),
          
            webView.heightAnchor.constraint(equalToConstant: 321),
            viewBottom.heightAnchor.constraint(equalToConstant: 210)
        ])
    }
    
    private func setupView() {
        balanceView.layer.cornerRadius = 12
        balanceView.clipsToBounds = true
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(actionTap))
        currencyView.addGestureRecognizer(gesture)
        
        sellView.layer.cornerRadius = 12
        sellView.clipsToBounds = true
        sellView.backgroundColor = UIColor(red: 0.996, green: 0.239, blue: 0.263, alpha: 1)
        
        buyView.layer.cornerRadius = 12
        buyView.clipsToBounds = true
        buyView.backgroundColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1)
        
        timerView.plusButton.addTarget(self, action: #selector(plusAction), for: .touchDown)
        timerView.minusButton.addTarget(self, action: #selector(minusAction), for: .touchDown)
        
        invest.plusButton.addTarget(self, action: #selector(plusActionInvest), for: .touchDown)
        invest.minusButton.addTarget(self, action: #selector(minusActionInvest), for: .touchDown)
       
        let tapGesturebuy = UITapGestureRecognizer(target: self, action: #selector(buyTap))
        buyView.addGestureRecognizer(tapGesturebuy)
        let tapGestureSell = UITapGestureRecognizer(target: self, action: #selector(buyTap))
        sellView.addGestureRecognizer(tapGestureSell)
        
    }
   
   private func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "‼️ SuccessFully ‼️"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "NOTIF", content: content, trigger: trigger)
        centr.add(request)
    }
    
    @objc func buyTap() {
        guard let text = invest.textFeild.text else {
            return
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        // Удаляем все запятые из текста
        let cleanedText = text.replacingOccurrences(of: ",", with: "")
        
        // Преобразуем текст в число
        if let number = numberFormatter.number(from: cleanedText) {
            let floatValue = number.floatValue
            
            if floatValue == 10585 {
                // Выводим алерт с сообщением об ошибке
                let alertController = UIAlertController(title: "Error", message: "Your balance is 10,000", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                present(alertController, animated: true, completion: nil)
            } else {
                sendNotification()
                invest.textFeild.text = "1,000"
            }
        }
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        viewBottom.frame.origin.y = viewBottom.frame.origin.y - 200
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        viewBottom.frame.origin.y = viewBottom.frame.origin.y + 200
    }
    
    
    @objc private func minusActionInvest() {
        seconds -= 100
        updateCountLabelInvest()
        invest.layer.borderColor = UIColor.clear.cgColor
        invest.layer.borderWidth = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountLabelInvest), userInfo: nil, repeats: true)
    }
    
    private func increaseInvestmentAmount() {
        let numberFormatter = NumberFormatter()
        numberFormatter.decimalSeparator = ","
        numberFormatter.numberStyle = .decimal
        
        if let currentAmountString = invest.textFeild.text,
            let currentAmount = numberFormatter.number(from: currentAmountString) {
            let increasedAmount = currentAmount.doubleValue + 0.100
            let updatedAmountString = numberFormatter.string(from: NSNumber(value: increasedAmount))
            
            invest.textFeild.text = updatedAmountString
        }
    }
    
    @objc private func plusActionInvest() {
        increaseInvestmentAmount()
        invest.layer.borderColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1).cgColor
        invest.layer.borderWidth = 1
        
//        timer?.invalidate()
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountLabelInvest), userInfo: nil, repeats: true)
    }
    
    @objc private func minusAction() {
        seconds -= 1
        updateCountLabel()
        timerView.layer.borderColor = UIColor.clear.cgColor
        timerView.layer.borderWidth = 0
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountLabel), userInfo: nil, repeats: true)
    }
    
    @objc private func plusAction() {
        seconds += 1
        updateCountLabel()
        if let currency = currencyView.balabceLabel.text {
            let urlString = "https://www.tradingview.com/chart/?symbol=\(currency)"
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
        timerView.layer.borderColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1).cgColor
        timerView.layer.borderWidth = 1
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountLabel), userInfo: nil, repeats: true)
    }

    @objc private func actionTap() {
        let vc = CurrencyViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func updateCountLabelInvest() {
        
        let stringFormat = String(format: "%.3f", seconds)

        invest.textFeild.text = stringFormat
    }
    
    @objc private func updateCountLabel() {
        let minutes = seconds / 60
        let secondsRemainder = seconds % 60
        
        let minutesString = String(format: "%02d", minutes)
        let secondsString = String(format: "%02d", secondsRemainder)
        
        let timeString = "\(minutesString):\(secondsString)"
        timerView.textFeild.text = timeString
    }
}

extension TradeViewController: CurrencyViewControllerProtocol {

    func selecText(text: String?) {
        currencyView.balabceLabel.text = text
        if let currency = text {
            let urlString = "https://www.tradingview.com/chart/?symbol=\(currency)"
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
    }
}


extension TradeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Получаем текущий текст в поле ввода
        guard let text = invest.textFeild.text else {
            return true
        }
        
        // Объединяем текущий текст и новую вставку
        let newText = (text as NSString).replacingCharacters(in: range, with: string)
        
        // Форматируем текст, вставляя запятые
        if let formattedText = formatText(newText) {
            // Устанавливаем отформатированный текст в поле ввода
            invest.textFeild.text = formattedText
        }
        
        // Возвращаем false, чтобы предотвратить автоматическое изменение текста
        return false
    }
    
    func formatText(_ text: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        // Удаляем все запятые из текста
        let cleanedText = text.replacingOccurrences(of: ",", with: "")
        
        // Преобразуем текст в число
        if let number = numberFormatter.number(from: cleanedText) {
            // Форматируем число с вставкой запятых
            return numberFormatter.string(from: number)
        }
        
        return nil
    }

}

extension TradeViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound, .banner])
    }
}

//
//  LaunchViewController.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import Foundation
import UIKit

final class LaunchViewController: ViewController {
    
    private let imageView = UIImageView()
    
    private var progressBar: UIView!
    private var progressView: UIView!
    
    private let nameProjectLabele = UILabel()
    
    private var progressLabel: UILabel!
    private  var progress: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        let progressBarWidth: CGFloat = view.frame.width - 100
        let progressBarHeight: CGFloat = 24
        
        progressBar = UIView(frame: CGRect(x: 50, y: view.frame.midY, width: progressBarWidth, height: progressBarHeight))
        progressBar.center = view.center
        progressBar.backgroundColor = .lightGray
        progressBar.layer.cornerRadius = 12
        progressBar.clipsToBounds = true
        view.addSubview(progressBar)
        
        
        progressView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: progressBarHeight))
        progressView.backgroundColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1)
        progressView.layer.cornerRadius = 12
        progressView.clipsToBounds = true
        progressBar.addSubview(progressView)
        
        progressLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        progressLabel.center = view.center
        progressLabel.textColor = .white
        progressLabel.textAlignment = .center
        progressLabel.font = .interFont(offSize: 16, weight: .extraBold)
        view.addSubview(progressLabel)
        
        loadMainScreen()
    }
    
    private  func loadMainScreen() {
        updateProgress(0.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.updateProgress(0.25)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.updateProgress(0.58)
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.updateProgress(1.0)
                    self.showMainScreen()
                }
            }
        }
    }
    
    private  func updateProgress(_ value: CGFloat) {
        progress = value
        
        let progressWidth = progressBar.frame.width * value
        progressView.frame = CGRect(x: 0, y: 0, width: progressWidth, height: progressBar.frame.height)
        
        let percentage = Int(value * 100)
        progressLabel.text = "\(percentage)%"
    }
    private  func showMainScreen() {
        let mainScreen = TabBarController()
        mainScreen.modalTransitionStyle = .coverVertical //??
        mainScreen.modalPresentationStyle = .fullScreen
        present(mainScreen, animated: false)
    }
    
    
    private func setupConstraints() {
        
        [imageView].forEach { value in
            view.addSubview(value)
            value.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    private func setupView() {
        imageView.image = UIImage(named: "BG")
    }
}

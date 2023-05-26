//
//  ViewController.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import UIKit

class ViewController: UIViewController {
    init() {super.init(nibName: nil, bundle: nil) }
    required init?(coder: NSCoder) { super.init(coder: coder)}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.11, green: 0.122, blue: 0.176, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
                title: "", style: .plain, target: nil, action: nil)
    }
}

extension UIViewController {
    func updateBackButton(){
        if self.navigationController != nil {
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        }
    }
}

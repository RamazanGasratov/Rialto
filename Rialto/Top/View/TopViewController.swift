//
//  TopViewController.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import Foundation
import UIKit

final class TopViewController: ViewController {
    
    private let topBackgroundView = BackgroundView()
    
    private var presenter: TopPresenter?
    
    private lazy var tableView = UITableView(frame: .zero, style: .grouped)
    
    private lazy var fonView = UIView()
    
    override init() {
        super.init()
        self.presenter = TopPresenter(delegate: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar()
        setupConstraints()
        setupView()
        presenter?.delegate = self
        tableView.backgroundColor = UIColor(red: 0.18, green: 0.188, blue: 0.243, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets.init(top: -15, left: 0, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.register(TopTableViewCell.self, forCellReuseIdentifier: "TopTableViewCell")
    }
    
    private func navigationBar() {
        let label = UILabel()
        label.text = "TOP 10 Traders"
        label.font = .interFont(offSize: 22, weight: .medium)
        label.textColor = .white
        navigationItem.largeTitleDisplayMode = .automatic
        navigationItem.titleView = label
    }
    
    
    private func setupConstraints() {
        
        view.addSubViews(fonView)
        fonView.addSubViews(topBackgroundView, tableView)
        
        NSLayoutConstraint.activate([
            fonView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55),
            fonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            fonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            fonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            
            topBackgroundView.topAnchor.constraint(equalTo: fonView.topAnchor),
            topBackgroundView.leadingAnchor.constraint(equalTo: fonView.leadingAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: fonView.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: fonView.topAnchor, constant: 33),
            tableView.leadingAnchor.constraint(equalTo: fonView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: fonView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: fonView.bottomAnchor)
        ])
    }
    
    
    private func setupView() {
        fonView.backgroundColor = .white
        fonView.layer.cornerRadius = 9
        fonView.clipsToBounds = true
    }
}

extension TopViewController: TopPresenterProtocol {
    func updateDepositLabel(with text: String, at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        if let cell = tableView.cellForRow(at: indexPath) as? TopTableViewCell {
            cell.depositLabel.text = text
        }
    }
    
    func updateProfitLabel(with text: String, at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        if let cell = tableView.cellForRow(at: indexPath) as? TopTableViewCell {
            cell.profitLabel.text = text
        }
    }
    
}

extension TopViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.topModel.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = presenter?.topModel[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopTableViewCell", for: indexPath) as? TopTableViewCell else {return UITableViewCell()}
        
        cell.configuration(model!)
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 0.337, green: 0.333, blue: 0.4, alpha: 1)
        } else {
            cell.backgroundColor = UIColor(red: 0.18, green: 0.188, blue: 0.243, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

                            

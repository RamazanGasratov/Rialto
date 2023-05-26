//
//  TabBarController.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        self.tabBar.tintColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1)
        
        viewControllers = [
            generatorNavigationController(viewController: TradeViewController(), image: "trade-2"),
            generatorNavigationController(viewController: TopViewController(), image: "toptop"),
        ]
        
        selectedIndex = 1
    }
    
    
    private func generatorNavigationController(
        viewController: UIViewController,
        image string: String) -> UINavigationController {

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 0.11, green: 0.122, blue: 0.176, alpha: 1)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
    

        let unselectedImage = UIImage(named: string)?.withRenderingMode(.alwaysOriginal)
        let selectedImage = unselectedImage?.withTintColor(UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1))
        
        navigationController.tabBarItem.image = unselectedImage
        navigationController.tabBarItem.selectedImage = selectedImage
        
        return navigationController
    }
}

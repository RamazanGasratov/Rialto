//
//  UICollectinView+Ext.swift
//  Rialto
//
//  Created by macbook on 24.05.2023.
//

import Foundation
import UIKit

extension UICollectionView {
    
    convenience init(frame: CGRect, scrolling: UICollectionView.ScrollDirection, spasing: CGFloat, sectionSpasing: UIEdgeInsets! = nil) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrolling
        layout.minimumLineSpacing = spasing
        layout.minimumInteritemSpacing = spasing
        layout.sectionInset = sectionSpasing ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }

}

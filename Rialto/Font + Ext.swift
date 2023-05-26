//
//  Font + Ext.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import UIKit
extension UIFont {
    //MARK: Font Montserrat
    enum Inter: String {
        case bold = "Inter-Bold"
        case extraBold = "Inter-ExtraBold"
        case italic = "Inter-Italic"
        case medium = "Inter-Medium"
        case regular = "Inter-Regular"
        case semibold = "Inter-Semibold"
    }
    
    class func interFont(offSize fontSize: CGFloat, weight: Inter) -> UIFont {
        return UIFont(name: weight.rawValue, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
    enum SFProText: String {
        case bold = "SFProText-Bold"
        case semibold = "SFProText-Semibold"
    }
    
    class func sFProTextFont(offSize fontSize: CGFloat, weight: SFProText) -> UIFont {
        return UIFont(name: weight.rawValue, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
}

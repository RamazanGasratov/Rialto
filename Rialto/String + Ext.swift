//
//  String + Ext.swift
//  Rialto
//
//  Created by macbook on 23.05.2023.
//

import Foundation
extension String {
    var localizedString: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.localizedBundle(), value: "", comment: "")
    }
}

extension Bundle {
    private static var bundle: Bundle!
    
    static var appName = Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String ?? Bundle.main.infoDictionary?["CFBundleName"] as? String
    
    static var version: String { Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""}

    public static func localizedBundle() -> Bundle {
        let appLang = Bundle.main.preferredLocalizations.first ?? "ru"

        if bundle == nil,
           let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
        {
            bundle = Bundle(path: path)
        }

        return bundle ?? Bundle.main.self
    }
}

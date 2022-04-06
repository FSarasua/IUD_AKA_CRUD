//
//  String+Extension.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasúa Galán on 6/4/22.
//

import Foundation

extension String {
    func localizeString() -> String {
        let path = Bundle.main.path(forResource: Locale.current.languageCode, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

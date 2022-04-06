//
//  Enums.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasúa Galán on 4/4/22.
//

import Foundation

enum ErrorType {
    case notValidURL
    case dataParsing
    
    case unknown
    
    /* URL Session */
    case dataError
    case noDataContent
    case responseError
    case statusCodeError
}

enum AlertType {
    case error
    case touchItem
    case deleteItem
}

enum MainViewMode {
    case remove
    case getInfo
}

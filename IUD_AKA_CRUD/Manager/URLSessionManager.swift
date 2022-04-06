//
//  URLSessionManager.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasúa Galán on 4/4/22.
//

import Foundation

class URLSessionManager {
    
    static let shared = URLSessionManager()
    
    /* Manager */
    let validationManager = ValidationManager.shared
    
    /* Functions */
    func requestURL(_ url: URL,
                    onSuccess: @escaping (Data) -> Void,
                    onError: @escaping (CustomError) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            self.validationManager.validateData(data, onSuccess: { data in
                self.validationManager.validateResponse(response, onSuccess: { onSuccess(data) }, onError: onError)
            }, onError: onError)
            
        }.resume()
    }
}

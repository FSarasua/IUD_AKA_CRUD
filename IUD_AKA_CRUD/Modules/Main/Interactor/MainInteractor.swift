//
//  MainInteractor.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasua Galan on 21/3/22.
//

import Foundation

class MainInteractor {
    // MARK: Viper
    var presenter: MainPresenter? = nil
    
    // MARK: Manager
    let urlSessionManager = URLSessionManager.shared
    let validationManager = ValidationManager.shared
}

protocol MainInteractorInput {
    func requestUserData(onSuccess: @escaping (ListUserServerModel) -> Void,
                         onError: @escaping (CustomError) -> Void)
}

extension MainInteractor: MainInteractorInput {
    
    func requestUserData(onSuccess: @escaping (ListUserServerModel) -> Void,
                         onError: @escaping (CustomError) -> Void) {
        
        let url = URL(string: KService.urlBase + KEndPoint.getUser)
        
        self.validationManager.validateURL(url, onSuccess: { url in
            self.urlSessionManager.requestURL(url, onSuccess: { data in
                self.validationManager.validateDataParsing(ListUserServerModel.self, data) { serverModel in
                    onSuccess(serverModel)
                } onError: { error in
                    onError(error)
                }
            }, onError: onError)
        }, onError: onError)
    }
}

//
//  MainPresenter.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasua Galan on 21/3/22.
//

import Foundation
import UIKit

class MainPresenter {
    var view: MainView? = nil
    var interactor: MainInteractor? = nil
    
    // MARK: Manager
    let alertManager = AlertManager.shared
}

protocol MainPresenterInput {
    func requestData()
    func didSelectItem(_ item: UserViewModel)
    func remove(_ index: Int, from dataTable: inout [UserViewModel])
}

extension MainPresenter: MainPresenterInput {
    
    func requestData() {
        interactor?.requestUserData(onSuccess: { serverModel in
            
            var data = [UserViewModel]()
            
            for model in serverModel {
                let user = UserViewModel(model)
                data.append(user)
            }
            
            self.view?.loadData(data)
            self.view?.reloadView()
            self.view?.stopLoading()
            self.view?.stopRefresh()
        }, onError: { error in
            let alert = self.alertManager.showAlert(withError: error)
            
            self.view?.showAlert(alert)
        })
    }
    
    func didSelectItem(_ item: UserViewModel) {
        let alert = self.alertManager.showInfoAlert(withTitle: item.name, message: item.birthdate)
        
        self.view?.showAlert(alert)
    }
    
    func remove(_ index: Int, from dataTable: inout [UserViewModel]) {
        let item = dataTable[index]
        let alert = self.alertManager.showRemoveAlert(name: item.name)
        
        dataTable.remove(at: index)
    
        self.view?.reloadView()
        self.view?.showAlert(alert)
    }
}

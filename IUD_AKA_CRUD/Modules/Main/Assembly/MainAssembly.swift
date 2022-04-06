//
//  MainAssembly.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasua Galan on 21/3/22.
//

import Foundation

class MainAssembly {
    
    static func create() -> MainViewController {
        let vc = MainViewController()
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return vc
    }
}

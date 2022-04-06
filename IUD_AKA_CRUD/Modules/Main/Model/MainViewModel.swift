//
//  MainViewModel.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasua Galan on 21/3/22.
//

import Foundation

struct MainViewModel {
    var dataTable: [UserViewModel]
    var mode: MainViewMode
    
    init() {
        self.dataTable = []
        self.mode = .getInfo
    }
}

struct UserViewModel {
    let name: String
    let birthdate: String
    
    init(name: String, birthdate: String) {
        self.name = name
        self.birthdate = birthdate
    }
    
    init(_ model: UserServerModel) {
        self.name = model.name ?? ""
        self.birthdate = model.birthdate ?? ""
    }
}

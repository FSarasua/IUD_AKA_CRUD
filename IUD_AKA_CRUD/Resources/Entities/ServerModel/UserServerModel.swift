//
//  User.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasua Galan on 21/3/22.
//

import Foundation

typealias ListUserServerModel = [UserServerModel]

struct UserServerModel: Codable {
    let id: Int?
    let name: String?
    let birthdate: String?
}

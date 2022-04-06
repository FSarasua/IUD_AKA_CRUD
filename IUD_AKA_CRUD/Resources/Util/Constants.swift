//
//  Constants.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasúa Galán on 4/4/22.
//

import Foundation

/* Buenas prácticas: Para hacer referencia a las constantes se escribirá al principio 'K', para que no entre en conflicto con otras posibles clases */

struct KService {
    static let urlBase = "https://hello-world.innocv.com/"
}

struct KEndPoint {
    static let getUser = "api/User"
}

struct KCellID {
    static let userDetail = "UserDetailCellID"
}

struct KNibName {
    static let userDetail = "UserDetailCollectionViewCell"
}

struct KSystemImageName {
    static let trash = "trash"
    static let paperplane = "paperplane"
}

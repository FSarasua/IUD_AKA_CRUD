//
//  AlertManager.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasúa Galán on 4/4/22.
//

import Foundation
import UIKit

class AlertManager {
    
    static let shared = AlertManager()
    
    func showAlert(withError error: CustomError) -> UIAlertController {
        var alert: UIAlertController
        
        alert = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "title.confirm".localizeString(), style: .destructive) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        
        return alert
    }
    
    func showInfoAlert(withTitle title: String, message: String) -> UIAlertController {
        var alert: UIAlertController
        
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "title.confirm".localizeString(), style: .destructive) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        
        return alert
    }
    
    func showRemoveAlert(name: String) -> UIAlertController {
        var alert: UIAlertController
        
        alert = UIAlertController(title: "title.attention".localizeString(), message: name + "message.remove".localizeString(), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "title.confirm".localizeString(), style: .destructive) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(action)
        
        return alert
    }
}

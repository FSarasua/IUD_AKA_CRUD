//
//  AppDelegate.swift
//  IUD_AKA_CRUD
//
//  Created by Francisco Javier Sarasua Galan on 21/3/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.makeKeyAndVisible()
        
        let navigation = UINavigationController(rootViewController: MainAssembly.create())
        
        window?.rootViewController = navigation
        
        return true
    }

}


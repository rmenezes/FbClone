//
//  AppDelegate.swift
//  FBSearchBar
//
//  Created by Raul Menezes on 4/18/19.
//  Copyright © 2019 Raul Menezes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewControlelr = ViewController()
        viewControlelr.view.backgroundColor = .white
        
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: viewControlelr)
        window?.makeKeyAndVisible()
        
        // Setup some Global appearence
        UINavigationBar.appearance().barTintColor = fbBlueLight
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        
        return true
    }
}


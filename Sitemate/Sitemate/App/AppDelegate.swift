//
//  AppDelegate.swift
//  Sitemate
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // MARK: Creating a base router for first launch,
        window?.rootViewController = SitemateRouter.createBaseModule()
        window?.makeKeyAndVisible()
        
        // Needed in case you ever change your schema, realm objects should not be called before this line.
        Common.setupRealm()

        return true
    }

}


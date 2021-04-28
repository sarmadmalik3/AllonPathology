//
//  AppDelegate.swift
//  Allon Pathology
//
//  Created by Malik Farhan Asim on 26/04/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: DashboardController())
        window?.makeKeyAndVisible()
        
        return true
    }
    
}


//
//  AppDelegate.swift
//  Crypty
//
//  Created by Nikita Kirshin on 20.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let navController = UINavigationController(rootViewController: LoginAssembly.build())
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()

        return true
    }


}


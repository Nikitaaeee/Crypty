//
//  AppDelegate.swift
//  Crypty
//
//  Created by Nikita Kirshin on 20.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
        
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    private let serviceAssembly = ServiceAssembly()
    private lazy var appCoordinator = AppCoordinator(window: window, serviceAssembly: serviceAssembly)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        appCoordinator.start()
        return true
    }


}


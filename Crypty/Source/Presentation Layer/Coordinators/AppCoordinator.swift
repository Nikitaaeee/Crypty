//
//  AppCoordinator.swift
//  Crypty
//
//  Created by Nikita Kirshin on 23.06.2022.
//

import Foundation
import UIKit

class AppCoordinator {
    
    //MARK: - Properties
    
    weak var window: UIWindow?
    private let serviceAssembly: IServiceAssembly
    
    //MARK: - Lifecycle
    
    init(window: UIWindow?, serviceAssembly: IServiceAssembly) {
        self.window = window
        self.serviceAssembly = serviceAssembly
    }
    
    func start() {
        serviceAssembly.authenticationService.isAuthorized ?
            presentCurrencyListModule() :
            presentLoginModule()
    }
}

//MARK: - ILoginOutput
extension AppCoordinator: ILoginOutput {
    func didLogin() {
        DispatchQueue.main.async { [weak self] in
            self?.presentCurrencyListModule()
        }
    }
}

//MARK: - Private

private extension AppCoordinator {
    func presentLoginModule() {
        let assembly = LoginBuilder()
        
        window?.rootViewController = UINavigationController(rootViewController: assembly.build(output: self))
        window?.makeKeyAndVisible()
    }
    
    func presentCurrencyListModule() {
        let assembly = CurrencyListBuilder(serviceAssembly: serviceAssembly)
        let rootViewController = assembly.build()
        let navigationViewController = UINavigationController(rootViewController: rootViewController)
        navigationViewController.navigationBar.tintColor = Colors.purple.value
        
        rootViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Logout",
            style: .plain,
            target: self,
            action: #selector(didRequestLogout(_:))
        )
        
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }
    
    @objc
    func didRequestLogout(_ sender: Any) {
        serviceAssembly.authenticationService.logout { [weak self] result in
            switch result {
            case .success:
                self?.presentLoginModule()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
        
    }
}

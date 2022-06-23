//
//  LoginAssembly.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

enum LoginAssembly {
    static func build() -> LoginViewController {
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interactor: interactor, router: router)
        let vc = LoginViewController(presenter: presenter)
        router.vc = vc
        
        return vc
    }
}

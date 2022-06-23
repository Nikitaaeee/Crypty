//
//  LoginAssembly.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

final class LoginBuilder {
    func build(output: ILoginOutput) -> LoginViewController {
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interactor: interactor, router: router)
        let vc = LoginViewController(presenter: presenter)
        router.vc = vc
        presenter.output = output
        
        return vc
    }
}

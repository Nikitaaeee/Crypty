//
//  LoginPresenter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol ILoginPresenter: AnyObject {
    func login(email: String?, password: String?)
    var ui: ILoginView? { get set }
}

final class LoginPresenter {
    
    weak var ui: ILoginView?
    private var interactor : ILoginInteractor
    private var router: ILoginRouter
    private var currentWeatherViewModel: LoginViewModel?
    
    init(interactor: ILoginInteractor, router: ILoginRouter) {
        self.interactor = interactor
        self.router = router
    }
}

extension LoginPresenter: ILoginPresenter {
    func login(email: String?, password: String?) {
        guard let email = email, !email.isEmpty else {
            return router.didRequestAlert(title: "Error", message: "Email is empty")
        }
        
        guard let password = password, !password.isEmpty else {
            return router.didRequestAlert(title: "Error", message: "Password is empty")
        }
        
        ui?.setLoading(true)
        interactor.login(email: email, password: password) { [weak self] status in
            guard let self = self else { return }
            self.ui?.setLoading(false)
            if status {
                self.router.routeToListScreen()
            } else {
                self.router.didRequestAlert(title: "Error", message: "Wrong email or password")
            }
        }
    }
        
    func routeToListScreen() {
        router.routeToListScreen()
    }
}

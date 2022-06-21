//
//  LoginPresenter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol ILoginPresenter: AnyObject {
}

final class LoginPresenter {
    
    private var ui: ILoginView?
    private var interactor : ILoginInteractor?
    private var router: ILoginRouter?
    private var currentWeatherViewModel: LoginViewModel?
    
    init(interactor: ILoginInteractor, router: ILoginRouter) {
        self.interactor = interactor
        self.router = router
    }
}

extension LoginPresenter: ILoginPresenter {
    func routeToListScreen() {
        router?.routeToListScreen()
    }
}

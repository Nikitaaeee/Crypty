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

protocol ILoginOutput: AnyObject {
    func didLogin()
}

final class LoginPresenter {
    
    //MARK: - Properties
    
    weak var ui: ILoginView?
    weak var output: ILoginOutput?
    private var interactor : ILoginInteractor
    private var router: ILoginRouter
    
    //MARK: - Lifecycle
    
    init(interactor: ILoginInteractor, router: ILoginRouter) {
        self.interactor = interactor
        self.router = router
    }
}

//MARK: - ILoginPresenter

extension LoginPresenter: ILoginPresenter {
    func login(email: String?, password: String?) {
        guard let email = email, !email.isEmpty else {
            
            return router.didRequestAlert(title: Constants.errorTitle, message: Constants.emailErrorMessage)
        }
        
        guard let password = password, !password.isEmpty else {
            
            return router.didRequestAlert(title: Constants.errorTitle, message: Constants.passwordErrorMessage)
        }
        
        ui?.setLoading(true)
        interactor.login(email: email, password: password) { [weak self] status in
            guard let self = self else { return }
            self.ui?.setLoading(false)
            if status {
                self.output?.didLogin()
            } else {
                self.router.didRequestAlert(title: Constants.errorTitle, message: Constants.emailOrPasswordErrorMessage)
            }
        }
    }
}

//MARK: - Constants

private extension LoginPresenter {
    enum Constants {
        static let errorTitle: String = "Error"
        static let emailErrorMessage: String = "Email is empty"
        static let passwordErrorMessage: String = "Password is empty"
        static let emailOrPasswordErrorMessage: String = "Wrong email or password"
    }
}

//
//  LoginInteractor.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol ILoginInteractor: AnyObject {
    func login(email: String, password: String, completion: @escaping (Bool) -> Void)
}

final class LoginInteractor {
    private var authService = AuthenticationService()
}

extension LoginInteractor: ILoginInteractor {
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        authService.login(email: email, password: password) { result in
            switch result {
            case .success(let status):
                completion(status)
            case .failure(_):
                print("error")
                completion(false)
            }
        }
    }

}

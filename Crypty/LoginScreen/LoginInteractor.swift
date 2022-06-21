//
//  LoginInteractor.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol ILoginInteractor: AnyObject {
    func checkLoginInfo(email: String, password: String) -> Bool
}

final class LoginInteractor {
    
}

extension LoginInteractor: ILoginInteractor {
    func checkLoginInfo(email: String, password: String) -> Bool {
        return true
    }
    
    
}

//
//  AuthenticationService.swift
//  Crypty
//
//  Created by Nikita Kirshin on 22.06.2022.
//

import Foundation

protocol IAuthenticationService {
    func login(email: String, password: String, completion: @escaping (Result<Bool,Error>) -> Void)

}



class AuthenticationService: IAuthenticationService {
    

    func login(email: String, password: String, completion: @escaping (Result<Bool,Error>) -> Void) {
        if mockEmail == email && mockPassword == password {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                completion(.success(true))
            }
        } else {
            completion(.success(false))
        }
    }
}

// MARK: - Constants

private let mockEmail: String = "Test"
private let mockPassword: String = "0000"

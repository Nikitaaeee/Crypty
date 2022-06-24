//
//  AuthenticationService.swift
//  Crypty
//
//  Created by Nikita Kirshin on 22.06.2022.
//

import Foundation

protocol IAuthenticationService {
    var isAuthorized: Bool { get }
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
    func logout(completion: @escaping (Result<Void, Error>) -> Void)
}



class AuthenticationService: IAuthenticationService {
    @UserDefaultsStorage(key: "AuthenticationService.isAuthorized", default: false)
    private(set) var isAuthorized: Bool
    
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        if mockEmail == email && mockPassword == password {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                completion(.success(()))
                self?.isAuthorized = true
            }
        } else {
//            completion(.failure(Error.)
            
        }
    }
    
    func logout(completion: @escaping (Result<Void, Error>) -> Void) {
        isAuthorized = false
        completion(.success(()))
    }
}

// MARK: - Constants

private let mockEmail: String = "Test"
private let mockPassword: String = "0000"

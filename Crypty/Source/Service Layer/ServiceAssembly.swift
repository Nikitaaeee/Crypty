//
//  ServiceAssembly.swift
//  Crypty
//
//  Created by Nikita Kirshin on 22.06.2022.
//

import Foundation

final class DIManager {
}

protocol IServiceAssembly {
    var networkService: INetworkService { get }
    var authenticationService: IAuthenticationService { get }
    var favoriteCryptoService: IFavoriteCryptoService { get }
}

final class ServiceAssembly: IServiceAssembly {
    let networkService: INetworkService = NetworkService()
    let authenticationService: IAuthenticationService = AuthenticationService()
    let favoriteCryptoService: IFavoriteCryptoService = FavoriteCryptoService()
    
    // MARK: - Init
    
    init() { }
}

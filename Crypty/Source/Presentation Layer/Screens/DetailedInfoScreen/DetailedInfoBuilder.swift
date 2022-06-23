//
//  DetailedInfoAssembly.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

final class DetailedInfoBuilder {
    private let networkService: INetworkService
    private let favoriteCryptoService: IFavoriteCryptoService
    
    private let datum: Datum
    
    init(networkService: INetworkService, favoriteCryptoService: IFavoriteCryptoService, datum: Datum) {
        self.networkService = networkService
        self.favoriteCryptoService = favoriteCryptoService
        self.datum = datum
    }
    
    func build() -> DetailedInfoViewController {
        let interactor = DetailedInfoInteractor(networkService: networkService, datum: datum)
        let router = DetailedInfoRouter()
        let presenter = DetailedInfoPresenter(interactor: interactor, router: router, favoriteCryptoService: favoriteCryptoService)
        let vc = DetailedInfoViewController(presenter: presenter)
        router.vc = vc
        
        return vc
    }
}

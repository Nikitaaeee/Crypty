//
//  CurrencyListAssembly.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

final class CurrencyListBuilder {
    private let serviceAssembly: IServiceAssembly
    
    init(serviceAssembly: IServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
    func build() -> CurrencyListViewController {
        let interactor = CurrencyListInteractor(networkService: serviceAssembly.networkService)
        let router = CurrencyListRouter(serviceAssembly: serviceAssembly)
        let presenter = CurrencyListPresenter(interactor: interactor, router: router, favoriteCryptoService: serviceAssembly.favoriteCryptoService)
        let vc = CurrencyListViewController(presenter: presenter)
        router.vc = vc
        
        return vc
    }
}

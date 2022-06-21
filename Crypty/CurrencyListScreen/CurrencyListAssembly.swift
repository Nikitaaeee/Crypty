//
//  CurrencyListAssembly.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

enum CurrencyListAssembly {
    static func build() -> CurrencyListViewController {
        let interactor = CurrencyListInteractor()
        let router = CurrencyListRouter()
        let presenter = CurrencyListPresenter(interactor: interactor, router: router)
        let vc = CurrencyListViewController(presenter: presenter)
        router.vc = vc
        
        return vc
    }
}

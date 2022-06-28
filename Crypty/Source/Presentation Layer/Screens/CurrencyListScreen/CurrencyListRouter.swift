//
//  CurrencyListRouter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

protocol ICurrencyListRouter: AnyObject {
    func goToSelecterRow(for datum: Datum)
}

final class CurrencyListRouter {
    weak var vc: UIViewController?
    private let serviceAssembly: IServiceAssembly
    
    init(serviceAssembly: IServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }
}

extension CurrencyListRouter: ICurrencyListRouter {
    
    func goToSelecterRow(for datum: Datum) {
        let builder = DetailedInfoBuilder(
            networkService: serviceAssembly.networkService,
            favoriteCryptoService: serviceAssembly.favoriteCryptoService,
            datum: datum
        )
        vc?.navigationController?.pushViewController(builder.build(), animated: true)
    }
}

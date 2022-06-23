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
//    var dtoModel: CryptoDTO()?
}

extension CurrencyListRouter: ICurrencyListRouter {
    
    func goToSelecterRow(for datum: Datum) {
        let destVC = DetailedInfoAssembly.build(diManager: .init(), datum: datum)
        self.vc?.navigationController?.pushViewController(destVC, animated: true)
    }
}

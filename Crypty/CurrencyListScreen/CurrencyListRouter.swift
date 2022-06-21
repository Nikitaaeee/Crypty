//
//  CurrencyListRouter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

protocol ICurrencyListRouter: AnyObject {
    func goToSelecterRow(for currency: String)
}

final class CurrencyListRouter {
    weak var vc: UIViewController?

}

extension CurrencyListRouter: ICurrencyListRouter {
    func goToSelecterRow(for currency: String) {
        let destVC = DetailedInfoAssembly.build()
        destVC.currency = currency
//        vc?.navigationController?.present(destVC, animated: true)
        self.vc?.navigationController?.pushViewController(destVC, animated: true)
    }
}

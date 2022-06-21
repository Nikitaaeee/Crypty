//
//  LoginRouter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

protocol ILoginRouter: AnyObject {
    func routeToListScreen()
}

final class LoginRouter {
    weak var vc: UIViewController?
}

extension LoginRouter: ILoginRouter {
    func routeToListScreen() {
        self.vc?.navigationController?.pushViewController(CurrencyListAssembly.build(), animated: true)
    }
}

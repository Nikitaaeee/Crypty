//
//  LoginRouter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

protocol ILoginRouter: AnyObject {
    func didRequestAlert(title: String, message: String)
}

final class LoginRouter {
    weak var vc: UIViewController?
}

extension LoginRouter: ILoginRouter {
    func didRequestAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        self.vc?.present(alertController, animated: true, completion: nil)
    }
}

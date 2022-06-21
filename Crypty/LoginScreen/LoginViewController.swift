//
//  LoginViewController.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private var presenter: LoginPresenter?
    private var router = LoginRouter()
    private var loginView = LoginView()
    
    init(presenter: LoginPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTapHandler()
    }
}

private extension LoginViewController {
    func configureTapHandler() {
        self.loginView.tapButtonHandler = { [weak self] in
            self?.presenter?.routeToListScreen()
        }
    }
}

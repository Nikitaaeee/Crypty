//
//  LoginViewController.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - Properties
    
    private var presenter: ILoginPresenter
    private var loginView = LoginView()
    
    //MARK: - Lifecycle
    
    init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        presenter.ui = loginView
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
        configureNavBar()
    }
}

//MARK: - Private

private extension LoginViewController {
    func configureTapHandler() {
        self.loginView.tapButtonHandler = { [weak self] view in
            self?.presenter.login(email: view.email, password: view.password)
        }
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = Colors.purple.value
        navigationItem.titleView?.tintColor = Colors.backgroundBlue.value
    }
}

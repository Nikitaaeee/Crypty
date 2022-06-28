//
//  LoginView.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit
import SnapKit

protocol ILoginView: AnyObject {
    func setLoading(_ isLoading: Bool)
    func didFailedValidation(reason: String)
    }

final class LoginView: UIView {
    
    var tapButtonHandler: ((LoginView) -> Void)?
    
    public var email: String? {
        emailTextField.text
    }
    public var password: String? {
        passwordTextField.text
    }

        
    private enum Constants {
        static let accountLoginLabelTextSize: CGFloat = 30
        static let accountLoginLabelTopConstraint = 42
        static let accountLoginLabelLeftConstraint = 20
        static let accountLoginLabelRightConstraint = 38
        
        static let emailLabelTopOffset = 100
        static let emailLaabelTrailingOffset = 20
        
        static let textFieldsOffset = 20
        
        static let emailPlaceholderHeight = 55
        
        static let textFieldCornerRadius: CGFloat = 6
        static let accountLabelHeight = 35
        static let emailAndPasswordLabelHeihgt = 23
        
        static let loginButtonTopOffset = 40
    }
    
    private enum Texts {
        static let accountLoginText: String = "Account Login"
        static let emailLabelText: String = "Email"
        static let passwordLabelText: String = "Password"

        static let emailPlaceholder: String = "Your email adress.."
        static let passwordPlaceholder: String = "Your password.."
        
        static let buttonText: String = "Login"
    }
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var accountLoginLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.accountLoginText
        label.font = AppFonts.bold30.font
        label.textColor = .white
        return label
    }()
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.emailLabelText
        label.font = AppFonts.medium20.font
        label.textColor = .white
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Constants.textFieldCornerRadius
        textField.layer.masksToBounds = true
        textField.clearButtonMode = .whileEditing
        textField.textColor = .white
        textField.backgroundColor = Colors.placeholderBlue.value
        textField.placeholder = Texts.emailPlaceholder
        textField.attributedPlaceholder = NSAttributedString(
            string: Texts.emailPlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        if let image = UIImage(named: "Envelope")  {
            textField.withImage(direction: .Left,
                                image: image,
                                colorSeparator: Colors.placeholderBlue.value,
                                colorBorder: Colors.purple.value)
        }
        return textField
    }()
    
    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.passwordLabelText
        label.font = AppFonts.medium20.font
        label.textColor = .gray
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Constants.textFieldCornerRadius
        textField.layer.masksToBounds = true
        textField.textColor = .white
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = Colors.placeholderBlue.value
        textField.attributedPlaceholder = NSAttributedString(
            string: Texts.passwordPlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        if let image = UIImage(named: "LockSimple")  {
            textField.withImage(direction: .Left,
                                image: image,
                                colorSeparator: Colors.placeholderBlue.value,
                                colorBorder: Colors.purple.value)
        }
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed) , for: .touchUpInside)
        button.backgroundColor = Colors.purple.value
        button.setTitle(Texts.buttonText, for: .normal)
        button.layer.cornerRadius = Constants.textFieldCornerRadius
        return button
    }()
    
}

extension LoginView: ILoginView {
    
    func setLoading(_ isLoading: Bool) {
        loginButton.isEnabled = !isLoading
        loginButton.isUserInteractionEnabled = !isLoading
    }
    
    func didFailedValidation(reason: String) {
        print(reason)
    }
    
    @objc
    func buttonPressed(_ sender: UIButton) {
        self.tapButtonHandler?(self)
    }
}

private extension LoginView {
    
    func setupLayout() {
        self.backgroundColor = Colors.backgroundBlue.value
        configureAccountLabel()
        configuraEmailLabel()
        configureEmailTextField()
        configurePasswordLabel()
        configurePasswordTextField()
        configureLoginButton()
    }
    
    func configureAccountLabel() {
        self.addSubview(accountLoginLabel)
        self.accountLoginLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(Constants.accountLoginLabelTopConstraint)
            make.leading.equalToSuperview().offset(Constants.accountLoginLabelLeftConstraint)
            make.trailing.equalToSuperview().inset(Constants.accountLoginLabelRightConstraint)
            make.height.equalTo(Constants.accountLabelHeight)
        }
    }
    
    func configuraEmailLabel() {
        self.addSubview(emailLabel)
        self.emailLabel.snp.makeConstraints { make in
            make.top.equalTo(self.accountLoginLabel.snp.bottom).offset(Constants.emailLabelTopOffset)
            make.leading.equalTo(self.accountLoginLabel.snp.leading)
            make.trailing.equalToSuperview().inset(Constants.emailLaabelTrailingOffset)
            make.height.equalTo(Constants.emailAndPasswordLabelHeihgt)
        }
    }
    
    func configureEmailTextField() {
        self.addSubview(emailTextField)
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(Constants.textFieldsOffset)
            make.leading.equalTo(self.emailLabel.snp.leading)
            make.trailing.equalTo(self.emailLabel.snp.trailing)
            make.height.equalTo(Constants.emailPlaceholderHeight)
        }
    }
    
    func configurePasswordLabel() {
        self.addSubview(passwordLabel)
        self.passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(Constants.textFieldsOffset)
            make.leading.equalTo(self.emailLabel.snp.leading)
            make.trailing.equalTo(self.emailLabel.snp.trailing)
            make.height.equalTo(Constants.emailAndPasswordLabelHeihgt)
        }
    }
    
    func configurePasswordTextField() {
        self.addSubview(passwordTextField)
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(self.passwordLabel.snp.bottom).offset(Constants.textFieldsOffset)
            make.leading.equalTo(self.emailLabel.snp.leading)
            make.trailing.equalTo(self.emailLabel.snp.trailing)
            make.height.equalTo(Constants.emailPlaceholderHeight)
        }
    }
    
    func configureLoginButton() {
        self.addSubview(loginButton)
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(Constants.loginButtonTopOffset)
            make.leading.equalTo(self.emailLabel.snp.leading)
            make.trailing.equalTo(self.emailLabel.snp.trailing)
            make.height.equalTo(Constants.emailPlaceholderHeight)
        }
    }
}


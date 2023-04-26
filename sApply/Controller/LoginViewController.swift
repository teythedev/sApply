//
//  LoginViewController.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 26.04.2023.
//

import UIKit

class LoginViewController: UIViewController, LoginViewModelDelegate {
    
    private let gradientLayer: CAGradientLayer = {
        let gl = CAGradientLayer()
        let topColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        let bottomColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        gl.colors = [topColor.cgColor, bottomColor.cgColor]
        gl.locations = [0,1]
        return gl
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "sApply"
        label.textAlignment = .center
        label.font = UIFont(name: "BaskerVille", size: 89)
        return label
    }()
    
    private let emailTextField: CustomTextField = {
        let tf = CustomTextField(padding: 8, height: 65)
        tf.placeholder = "Enter Email"
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    private let passwordTextField : CustomTextField = {
        let tf = CustomTextField(padding: 8, height: 65,isSecure: true)
        tf.placeholder = "Enter Password"
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle( "Login", for: .normal)
        button.addTarget(self, action: #selector(LoginButtonTapped), for: .touchUpInside)
        button.backgroundColor = .tertiarySystemBackground
        button.layer.cornerRadius = 12
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .tertiaryLabel
        button.isEnabled = false
        return button
    }()
    
    private let goToRegister: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go to Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.addTarget(self, action: #selector(handleGoToLogin), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func handleGoToLogin() {
        let registerController = ViewController()
        //loginController.delegate = self.delegate
        navigationController?.pushViewController(registerController, animated: true)
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            label,
            emailTextField,
            passwordTextField,
            loginButton,
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.setCustomSpacing(50, after: passwordTextField)
        stackView.setCustomSpacing(60, after: label)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    
    var viewModel: LoginViewModelProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        viewModel?.delegate = self
        view.backgroundColor = .orange
        view.layer.addSublayer(gradientLayer)
        view.addSubViews(views: stackView,goToRegister)
        setConstraints()
        setupBindables()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    func handleViewModelOutput(_ output: LoginViewModelOutput) {
        
    }
    
    @objc private func LoginButtonTapped() {
        viewModel?.performLogin()
    }
    
    @objc private func handleTextChange(textField: UITextField) {
        if textField == emailTextField {
            viewModel?.email = textField.text
        } else {
            viewModel?.password = textField.text
        }
    }
    
    private func setupBindables() {
        viewModel?.isFormValid.bind(observer: { [ weak self ] result in
            guard let result = result else { return }
            self?.loginButton.isEnabled = result
            self?.loginButton.setTitleColor(result ? .black : .gray, for: .normal)
            self?.loginButton.backgroundColor = result ? .white : .tertiaryLabel
        })
    }
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant:  -10),
            goToRegister.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            goToRegister.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
}

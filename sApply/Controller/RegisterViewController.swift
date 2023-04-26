//
//  RegisterViewController.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 27.04.2023.
//

import UIKit

class RegisterViewController: UIViewController, RegisterViewModelDelegate {
    
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

    private let nameTextField: CustomTextField = {
        let tf = CustomTextField(padding: 8, height: 65)
        tf.placeholder = "Enter Name"
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    private let SurnameTextField : CustomTextField = {
        let tf = CustomTextField(padding: 8, height: 65)
        tf.placeholder = "Enter Surname"
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
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
        tf.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        return tf
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            label,
            nameTextField,
            SurnameTextField,
            emailTextField,
            passwordTextField,
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.setCustomSpacing(50, after: passwordTextField)
        stackView.setCustomSpacing(60, after: label)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var viewModel: RegisteViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        view.layer.addSublayer(gradientLayer)
        view.addSubViews(views: stackView)
        
        setConstraints()
        setupBindables()
        setupNotificationObservers()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    
    private func setupBindables() {
        viewModel?.isFormValid.bind(observer: { [ weak self ] result in
            guard let result = result else { return }
//            self?.loginButton.isEnabled = result
//            self?.loginButton.setTitleColor(result ? .black : .gray, for: .normal)
//            self?.loginButton.backgroundColor = result ? .white : .tertiaryLabel
        })
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant:  -10),
//            goToRegister.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            goToRegister.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    @objc private func handleTextChange(textField: UITextField) {
        if textField == emailTextField {
            viewModel?.email = textField.text
        } else if textField == passwordTextField  {
            viewModel?.password = textField.text
        } else if textField == nameTextField {
            viewModel?.email = textField.text
        } else  {
            viewModel?.password = textField.text
        }
    }
    
    private func setupNotificationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func handleKeyboardHide(notification: Notification) {
        view.endEditing(true)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseOut){ [weak self] in
            self?.view.transform = .identity
        }
    }
    
    @objc fileprivate func handleKeyboardShow(notification: Notification) {
        guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = value.cgRectValue
        
        // find the gap between register button and bottom of the screen
        let bottomSpace = view.frame.height - stackView.frame.origin.y - stackView.frame.height
        
        let difference = keyboardFrame.height - bottomSpace
        self.view.transform = CGAffineTransform(translationX: 0, y: -difference - 8)
    }


}

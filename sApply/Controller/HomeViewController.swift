//
//  HomeViewController.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 25.04.2023.
//

import UIKit



final class HomeViewController: UIViewController, HomeViewModelDelegate {
    func handleViewModelOutput(_ output: HomeViewModelOutput) {
        switch output {
        case .gotoLoginPage(let viewController):
            present(viewController, animated: true)
        }
    }
    
    var viewModel: HomeViewModelProtocol?
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "This is Home View"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(label)
        setConstraints()
        viewModel?.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel?.fetchCurrentUser(completion: {[weak self] user in
            if let user = user {
                print("\(user.name)")
            } else {
                    let lgn = LoginViewController()
                    let navController = UINavigationController(rootViewController: lgn)
                    lgn.viewModel = LoginViewModel()
                    navController.modalPresentationStyle = .fullScreen
                    self?.present(navController, animated: true)
            }
        })
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate( [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }

    
   
}



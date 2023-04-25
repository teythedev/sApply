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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = HomeView(frame: view.frame)
        viewModel?.delegate = self
        viewModel?.fetchCurrentUser(completion: {[weak self] user in
            if let user = user {
                print("\(user.name)")
            } else {
                self?.present(ViewController(), animated: true)
            }
        })
        
    }

    
   
}



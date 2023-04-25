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
        
    }
    override func viewDidLayoutSubviews() {
        viewModel?.fetchCurrentUser(completion: {[weak self] result in
            if !result {
                self?.present(ViewController(), animated: true)
            }
        })
    }
    
   
}



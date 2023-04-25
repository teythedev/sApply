//
//  HomeViewModel.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 25.04.2023.
//

import Foundation



final class HomeViewModel: HomeViewModelProtocol {
    func fetchCurrentUser(completion: @escaping (Bool) -> ()) {
        if isUserLoggedIn {
            print("Current User is: Bla")
        } else {
            print("User not logged In")
            let vc = ViewController()
            vc.view.backgroundColor = .red
            vc.modalPresentationStyle = .fullScreen
            completion(false)
            //delegate?.handleViewModelOutput(.gotoLoginPage(vc))
        }
    }
    

    
    var delegate: HomeViewModelDelegate?
    
    private var isUserLoggedIn = false
    

    
}

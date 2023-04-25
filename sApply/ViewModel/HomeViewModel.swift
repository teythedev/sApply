//
//  HomeViewModel.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 25.04.2023.
//

import Foundation



final class HomeViewModel: HomeViewModelProtocol {
    func fetchCurrentUser(completion: @escaping (User?) -> ()) {
        if isUserLoggedIn {
            print("Current User is: Bla")
            completion(User(name: "Emre"))
        } else {
            print("User not logged In")
            completion(nil)
        }
    }
    

    
    var delegate: HomeViewModelDelegate?
    
    private var isUserLoggedIn = false
    

    
}

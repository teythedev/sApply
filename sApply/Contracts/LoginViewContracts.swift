//
//  LoginViewContracts.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 26.04.2023.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: LoginViewModelOutput)
}

enum LoginViewModelOutput {
    case userLoggedIn(Bool)
}


protocol LoginViewModelProtocol {
    var delegate: LoginViewModelDelegate? { get set }
    
    var isFormValid: Bindable<Bool> { get set }
    
    var email: String? {get set}
    
    var password: String? {get set}
    
    func performLogin()
    
    
}

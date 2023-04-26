//
//  RegisterViewContracts.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 27.04.2023.
//

import Foundation



protocol RegisterViewModelDelegate: AnyObject {
    
}

enum RegisterViewModelOutput {}


protocol RegisteViewModelProtocol {
    var delegate: RegisterViewModelDelegate? { get set }
    
    var isFormValid: Bindable<Bool> { get set }
    
    var email: String? { get set }
    
    var password: String? { get set }
    
    var name: String? { get set }
    
    var surname: String? { get set }
}


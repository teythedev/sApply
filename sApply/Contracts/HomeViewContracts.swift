//
//  HomeViewContracts.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 25.04.2023.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: HomeViewModelOutput)
}

enum HomeViewModelOutput {
    case gotoLoginPage(ViewController)
}

protocol HomeViewModelProtocol {
    var delegate: HomeViewModelDelegate? { get set }
    func fetchCurrentUser(completion: @escaping () -> ())
}

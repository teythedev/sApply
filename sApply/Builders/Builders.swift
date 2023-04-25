//
//  Builders.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 25.04.2023.
//

import Foundation

extension HomeViewController {
    static func make(with viewModel: HomeViewModelProtocol) -> HomeViewController {
        let homeViewController = HomeViewController()
        homeViewController.viewModel = viewModel
        return homeViewController
    }
}

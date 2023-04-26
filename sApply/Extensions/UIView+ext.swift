//
//  UIView+ext.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 27.04.2023.
//

import UIKit

extension UIView {
    func addSubViews(views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}

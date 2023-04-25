//
//  HomeView.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 25.04.2023.
//

import UIKit

class HomeView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "This is Home View"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        addSubview(label)
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate( [
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

    }
}

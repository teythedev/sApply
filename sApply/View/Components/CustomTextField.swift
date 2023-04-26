//
//  CustomTextField.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 26.04.2023.
//

import UIKit

final class CustomTextField: UITextField {

    let padding: CGFloat
    let height: CGFloat
    
    
    init(padding: CGFloat, height: CGFloat, isSecure: Bool = false) {
        self.padding = padding
        self.height = height
        super.init(frame: .zero)
        layer.cornerRadius = height / 2
        backgroundColor = .white
        isSecureTextEntry = isSecure
        setIcon()
        
    }

    private func setIcon() {

    }
    
    @objc private func handleSecure(){
        print("Seru")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    

    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

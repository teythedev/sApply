//
//  Bindable.swift
//  sApply
//
//  Created by Tugay Emre Yucedag on 26.04.2023.
//

import Foundation


final class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping(T?) -> ()) {
        self.observer = observer
    }
}

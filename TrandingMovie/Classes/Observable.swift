//
//  Observable.swift
//  TrandingMovie
//
//  Created by Артем Орлов on 21.03.2023.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet{
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bing(_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
}

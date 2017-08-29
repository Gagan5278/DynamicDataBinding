//
//  Dynamic.swift
//  DynamicDataBinding
//
//  Created by Gagan Vishal Mishra on 24/08/17.
//  Copyright © 2017 Gagan Vishal Mishra. All rights reserved.
//

//It's a generic class which can accept any data type. Please change in Dynamic would not reflect until change in value of Dynamic
import Foundation

class Dynamic <T>{
    
    typealias Listener = (T) -> Void
    
    var listenerObject : Listener?
    
    func bind(listener : @escaping Listener)
    {
        self.listenerObject = listener
    }
    
    func bindAndFire(listener : @escaping Listener)
    {
        self.listenerObject = listener
        listener(value)
    }
    
    var value : T {
        didSet {
            self.listenerObject!(value)
        }
    }
    
    init(_ value : T) {
        self.value = value
    }
    
}

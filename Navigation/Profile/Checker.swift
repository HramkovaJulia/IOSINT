//
//  Checker.swift
//  Navigation
//
//  Created by Julia on 30.06.2023.
//

import Foundation

class Checker {
    
    static var shared = Checker()
    
    private let login = "Julia"
    
    private let password = "123"
    
    private init() {}
    
    func checker(log: String, pass: String) -> Bool {
        if log == login && pass == password {
            return true
        } else {
            return false
        }
    }
}

struct LoginInspector: LoginViewControllerDelegate {
    func check(logg: String, pass: String) -> Bool {
        let result = Checker.shared.checker(log: logg, pass: pass)
        return result
    }
}

//
//  LoginFactory.swift
//  Navigation
//
//  Created by Julia on 30.06.2023.
//

import Foundation

protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
   
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}

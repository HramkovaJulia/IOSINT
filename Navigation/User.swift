//
//  User.swift
//  Navigation
//
//  Created by Julia on 29.06.2023.
//

import UIKit

protocol UserService {
    func checkLogin(name: String) -> User?
}

class User {
    
    var name: String
    var fullName: String
    var status: String
    var image: UIImage
    
    init(name: String, fullName: String, status: String, image: UIImage) {
        self.name = name
        self.fullName = fullName
        self.status = status
        self.image = image
    }
}

class CurrentUserService: UserService {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }   
    
    func checkLogin(name: String) -> User? {
        if user.name == name {
            return user
        } else {
            print("Error")
            return nil
        }
    }
}

class TestUserService: UserService {
   
    var user = User(name: "test", fullName: "test", status: "test", image: UIImage(named: "teo")!)
    
    func checkLogin(name: String) -> User? {
        if user.name == name {
            return user
        } else {
            print("Error")
            return nil
        }
    }
}

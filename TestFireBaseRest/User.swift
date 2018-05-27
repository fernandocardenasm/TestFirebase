//
//  User.swift
//  TestFireBaseRest
//
//  Created by Fernando on 27.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

struct UserRequest: Codable {
    
    let email: String
    let password: String
    
    let returnSecureToken: Bool
    
}

struct UserLoggedIn: Decodable {
    
    let email: String
    let localId: String
    let idToken: String
    
}

struct NewObjectId: Decodable {
    let name: String
}

struct User: Codable {
    
    let email: String
    let products: [String: Product?]
}

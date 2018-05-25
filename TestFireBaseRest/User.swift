//
//  User.swift
//  TestFireBaseRest
//
//  Created by Fernando on 24.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let email: String
    let password: String
    let returnSecureToken: Bool
    
}

struct UserResponse: Decodable {
    let email: String
    let idToken: String
    let localId: String
}

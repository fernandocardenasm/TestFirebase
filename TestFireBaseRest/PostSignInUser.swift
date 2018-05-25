//
//  SignInUser.swift
//  TestFireBaseRest
//
//  Created by Fernando on 24.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class PostSignInUser: APIRequest {
    
    typealias Response = UserResponse
    
    var resourceName: String {
        return "/verifyPassword"
    }

    
}

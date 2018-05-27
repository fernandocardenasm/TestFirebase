//
//  PutUserProduct.swift
//  TestFireBaseRest
//
//  Created by Fernando on 27.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class PutUserProduct: APIRequest {
    
    typealias Response = Product
    
    var resourceName: String {
        return "/users/\(userId)/products/\(productId)"
    }
    
    let userId: String
    let productId: String
    
    init(userId: String, productId: String) {
        self.userId = userId
        self.productId = productId
    }
    
}

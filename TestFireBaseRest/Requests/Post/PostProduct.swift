//
//  PostProduct.swift
//  TestFireBaseRest
//
//  Created by Fernando on 24.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

class PostProduct: APIRequest {
    
    typealias Response = NewObjectId
    
    var resourceName: String {
        return "/products"
    }
    
}
